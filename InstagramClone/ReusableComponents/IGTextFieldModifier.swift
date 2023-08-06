//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by Khater on 8/6/23.
//

import SwiftUI

enum IGTextFieldType {
    case email
    case username
    case password
}

struct IGTextFieldModifier: ViewModifier {
    
    let type: IGTextFieldType
    
    func body(content: Content) -> some View {
        switch type {
        case .email:
            content
                .autocapitalization(.none)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        case .username:
            content
                .autocapitalization(.none)
                .keyboardType(.asciiCapable)
                .disableAutocorrection(true)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        case .password:
            content
                .font(.subheadline)
                .textContentType(.password)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
        }
    }
}
