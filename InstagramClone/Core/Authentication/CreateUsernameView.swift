//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @State private var username = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 12) {
                    Text("Create Username")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("This username will be visible to other users")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                CustomTextFeild(type: .username, binding: $username)
                
                
                NavigationLink {
                    CreatePasswordView()
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
