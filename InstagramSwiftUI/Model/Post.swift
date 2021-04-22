//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 18/04/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerId: String
    let ownerUsername: String
    var likes: Int
    let imageUrl: String
    let caption: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
    var user: User?
}

