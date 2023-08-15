//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = EditProfileViewModel()
    
    
    var body: some View {
        VStack {
            // Toolbar
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("Done") {
                    
                }
            }
            .padding()
            
            Divider()
            
            
            // Edit Profile Pic
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .background(.black)
                            .clipShape(Circle())
                            .frame(width: 90, height: 90)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .padding()
                            .background(.gray)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .frame(width: 90, height: 90)
                    }
                   
                    
                    Text("Edit Profile Picture")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
            .padding()
            
            Divider()
            
            // Edit Profile Info
            EditProfileTextInputView(title: "Name", text: $viewModel.fullName)
            
            EditProfileTextInputView(title: "Bio", text: $viewModel.bio)
            
            Spacer()
        }
    }
}


fileprivate struct EditProfileTextInputView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 18)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField("", text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
