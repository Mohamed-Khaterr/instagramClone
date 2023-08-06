//
//  CreatePasswordView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 12) {
                    Text("Create Password")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("You'r password must be at least 6 characters in length")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(IGTextFieldModifier(type: .password))
                
                
                NavigationLink {
                    CompleteSignUpView()
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
