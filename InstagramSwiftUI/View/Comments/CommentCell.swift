//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 19/04/21.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username)
                .font(.system(size: 14, weight: .semibold))
            
            Text(" \(comment.commentText)")
                .font(.system(size: 14))
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .font(.system(size: 12))
                .foregroundColor(.gray)
               
        }
        .padding(.horizontal)
    }
}

/*struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}*/
