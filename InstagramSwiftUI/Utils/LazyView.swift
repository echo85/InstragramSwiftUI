//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 21/04/21.
//

import SwiftUI


struct LazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
