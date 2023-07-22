//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Khater on 7/13/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 12) {
                    Text("Add your email")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("You'll use this email to sign in to your account")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                CustomTextFeild(type: .email, binding: $email)
                
                
                NavigationLink {
                    CreateUsernameView()
                } label: {
                    Text("Next")
                        .modifier(IGButtonModifier())
                }
                .padding(.top)
            }
            .padding(.horizontal, 24)
        }
    }
}
