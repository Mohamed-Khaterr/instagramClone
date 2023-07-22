//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct ProfileView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // Header
            ProfileHeaderView(user: user)
            
            // Post Grid View
            ProfilePostGridView(posts: Post.MOCK_POSTS)
            
            Spacer()
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

