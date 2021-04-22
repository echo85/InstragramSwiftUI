//
//  CommentsViewModel.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 19/04/21.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
        fecthComments()
    }
    
    func uploadComment(commentText: String) {
        guard let postId = self.post.id else { return }
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data = ["username" : user.username,
                    "profileImageUrl": user.profileImageUrl,
                    "uid": user.id ?? "",
                    "timestamp": Timestamp(date: Date()),
                    "postOwnerId": self.post.ownerId,
                    "commentText": commentText] as [String : Any]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { (error) in
            if let error = error {
                print("DEBUG Error: \(error.localizedDescription)")
                return
            }
            
            NotificationsViewModel.uploadNotification(toUid: self.post.ownerId, type: .comment, post: self.post)
        }
    }
    
    func fecthComments() {
        guard let postId = self.post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { (snapshot, _) in
            snapshot?.documentChanges.forEach({ (change) in
                if change.type == .added {
                    guard let comment = try? change.document.data(as: Comment.self) else { return }
                    self.comments.append(comment)
                }
            })
        }
        
    }
}
