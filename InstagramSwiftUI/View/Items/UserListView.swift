//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 08/04/21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView() {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination: LazyView(ProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                    
                    
                }
            }
        }
    }
}
