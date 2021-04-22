//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 26/03/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                                    
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}