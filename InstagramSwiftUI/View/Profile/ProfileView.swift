//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 26/03/21.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                    
                
                PostGridView(config: .profile(user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(username: "Carlo", email: "cfalchi@gmail.com", fullname: "Carlo Falchi", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/instagramswiftuitutorial-f5303.appspot.com/o/profile_image%2F272BE1D1-961C-4D0A-B9DD-F18B7C96A309?alt=media&token=77022375-c768-4a44-9316-900be17acc73", id: "eHGCFvrulHThyekePiEKhDsbyU93"))
    }
}
