//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 21/04/21.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var didUpdateBio = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserData(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { (_) in
            self.user.bio = bio
            self.didUpdateBio = true
        }
    }
}
