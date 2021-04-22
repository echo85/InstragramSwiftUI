//
//  PostGridView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 08/04/21.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2, content: {
            
            ForEach(viewModel.posts) { post in
                
                NavigationLink(
                    destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                    label: {
                        KFImage(URL(string:post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                    })
            }
            
            
        })
       
    }
}

/*struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
*/
