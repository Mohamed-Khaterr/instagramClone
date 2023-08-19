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
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
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
                    Task{
                        do {
                            try await viewModel.updateUserData()
                            
                            dismiss()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .padding()
            
            Divider()
            
            
            // Edit Profile Pic
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    CircularProfileImageView(imageURLString: viewModel.currentProfileImage,
                                             image: viewModel.selectedProfileImage,
                                             size: .large)
                   
                    
                    Text("Edit Profile Picture")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
            .padding()
            
            Divider()
            
            // Edit Profile Info
            EditProfileTextInputView(title: "Name", placeholder: "Your name", text: $viewModel.fullName)
            
            EditProfileTextInputView(title: "Bio", placeholder: "Your bio", text: $viewModel.bio)
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(.systemGray)))
                    .scaleEffect(2)
                
            }
            
            Spacer()
        }
    }
}


fileprivate struct EditProfileTextInputView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 18)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
