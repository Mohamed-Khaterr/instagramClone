//
//  CustomTextFeild.swift
//  InstagramClone
//
//  Created by Khater on 7/13/23.
//

import SwiftUI

enum TextFieldType {
    case email
    case username
    case password
}


struct CustomTextFeild: View {
    
    private let type: TextFieldType
    @State private var bind: Binding<String>
    
    init(type: TextFieldType, binding bind: Binding<String>) {
        self.type = type
        self.bind = bind
    }
    
    var body: some View {
        switch type {
        case .email:
            TextField("Email", text: bind)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        case .username:
            TextField("Username", text: bind)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        case .password:
            SecureField("Password", text: bind)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}
