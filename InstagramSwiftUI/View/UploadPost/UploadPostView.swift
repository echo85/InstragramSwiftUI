//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 26/03/21.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                        
                    
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                
                HStack(alignment: .top) {
                    
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                    
                    
                }
                .padding()
                
                HStack(spacing: 16) {
                    Button(action: {
                        captionText = ""
                        selectedImage = nil
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .padding()
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 40)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(5.0)
                            
                    })
                    
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { (_) in
                                captionText = ""
                                selectedImage = nil
                                tabIndex = 0
                            }
                        }
                    }, label: {
                        Text("Share")
                            .padding()
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5.0)
                            
                    })
                }
            }
            Spacer()
        }
        
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
