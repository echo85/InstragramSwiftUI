//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 19/04/21.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    
    init(post: Post) {
        viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment:.leading, spacing: 20) {
                    ForEach(viewModel.comments) {comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            
            CustomInputView(inputString: $commentText, action: uploadPost)
        }
        .padding(.top)
        
    }
    
    func uploadPost() {
        viewModel.uploadComment(commentText: commentText)
        self.commentText = ""
    }
}

/*struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}*/
