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
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo
                Image("instagram-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // TextFields
                VStack {
                    TextField("Email or username", text: $email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 24)
                
                
                // Forgot Password Button
                Button("Forgot Password?") {
                    print("Forgot Pasword button")
                }
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.top)
                .padding(.trailing, 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // Login Button
                Button {
                    print("Login Button")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.top)
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
                    Text("Resiter")
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
