//
//  CustomButton.swift
//  InstagramClone
//
//  Created by Khater on 7/13/23.
//

import SwiftUI

struct CustomButton: View {
    
    private let title: String
    private let action: (() -> Void)?
    
    init(title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color(.systemBlue))
                .cornerRadius(10)
        }
    }
}
