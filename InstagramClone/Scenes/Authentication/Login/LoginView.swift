//
//  LoginView.swift
//  InstagramClone
//
//  Created by Khater on 7/13/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo
                Image("instagram-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                
                VStack {
                    // TextFields
                    TextField("Email", text: $viewModel.email)
                        .modifier(IGTextFieldModifier(type: .email))
                    
                    SecureField("Password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier(type: .password))
                    
                    // Forgot Password Button
                    Button("Forgot Password?") {
                        print("Forgot Pasword button")
                    }
                    .font(.footnote)
                    .fontWeight(.medium)
                    .padding(.trailing, 24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                    // Login Button
                    Button {
                        Task {
                            do {
                                try await viewModel.login()
                            } catch {
                                
                            }
                        }
                    } label: {
                        Text("Login")
                            .modifier(IGButtonModifier())
                    }
                }
                .padding(.horizontal, 24)
                
                
                // Or Divider
                HStack {
                    
                    Spacer()
                        .frame(height: 1)
                        .background(.gray)
                        .opacity(0.5)
                    
                    Text("or")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 1)
                        .background(.gray)
                        .opacity(0.5)
                }
                .padding()
                
                // Socail Media Login
                HStack(spacing: 36) {
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
                
                // Register Link
                NavigationLink {
                    AddEmailView()
                    
                } label: {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.medium)
                }
                .padding(.vertical, 24)
            }
        }
    }
}
