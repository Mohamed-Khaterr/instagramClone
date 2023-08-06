//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct CreateUsernameView: View {
    
    // @EnvironmentObject: to use viewModel without passing it to each view
    @EnvironmentObject var viewModel: RegistrationViewModel
    
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
                
                
                TextField("Username", text: $viewModel.username)
                    .modifier(IGTextFieldModifier(type: .username))
                
                
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
