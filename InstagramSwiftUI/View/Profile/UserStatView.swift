//
//  UserStatView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 09/04/21.
//

import SwiftUI

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15, weight: .semibold))
        }.frame(width: 80, alignment: .center)
    }
}


struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}
