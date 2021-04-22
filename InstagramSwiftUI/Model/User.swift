//
//  User.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 13/04/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let fullname: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    var bio: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
