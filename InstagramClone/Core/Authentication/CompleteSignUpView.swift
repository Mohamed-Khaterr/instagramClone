//
//  CompleteSignUpView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                VStack(spacing: 12) {
                    Text("Welcome to instagram")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Click below to complete registration and start using instagram")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                
                Button {
                    print("Finish")
                } label: {
                    Text("Get Started!")
                        .modifier(IGButtonModifier())
                }
                .padding(.top)
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden()
        }
    }
}
