//
//  NotificationCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 09/04/21.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    
    var isFollowed: Bool {
        return viewModel.notification.isFollowed ?? false
    }
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(
                    destination: LazyView(ProfileView(user: user)),
                    label: {
                        KFImage(URL(string:viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        Text(viewModel.notification.username)
                                .font(.system(size: 14, weight: .semibold))
                        + Text(viewModel.notification.type.notificationMessage)
                            .font(.system(size: 15))
                            + Text(" \(viewModel.timestampString)").foregroundColor(.gray)
                                .font(.system(size: 12))
                    })
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(
                        destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                        label: {
                            KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                        })
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
        }
        .padding(.horizontal)
    }
}

/*struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
*/
