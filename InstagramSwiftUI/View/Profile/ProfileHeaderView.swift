//
//  ProfileHeaderView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 09/04/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    if let stats = viewModel.user.stats {
                        UserStatView(value: stats.posts, title: "Posts")
                        UserStatView(value: stats.followers, title: "Followers")
                        UserStatView(value: stats.following, title: "Following")
                    }
                }
                .padding(.trailing, 32)
                
                
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading,.top])
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

