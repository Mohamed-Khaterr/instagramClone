//
//  ProfileStatusView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct ProfileStatusView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text(String(value))
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
    }
}
