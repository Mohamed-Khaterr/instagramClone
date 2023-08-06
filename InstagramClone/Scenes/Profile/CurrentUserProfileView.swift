//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI


struct CurrentUserProfileView: View {
    
    private let currentUser: User = User.MOCK_USERS[0]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // Header
                ProfileHeaderView(isCurrentUser: true, user: currentUser)
                
                // Post Grid View
                ProfilePostGridView(posts: Post.MOCK_POSTS)
                
                Spacer()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Sheet Button Pressed")
                        try? AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}
