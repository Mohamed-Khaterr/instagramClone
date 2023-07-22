//
//  IGButtonModifier.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct IGButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
    }
}
