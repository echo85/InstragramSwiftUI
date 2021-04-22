//
//  CustomInputView.swift
//  InstagramSwiftUI
//
//  Created by Carlo Falchi on 19/04/21.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputString: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comment...", text: $inputString)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            
        }
        
        
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(inputString: .constant("")) {
            
        }
    }
}
