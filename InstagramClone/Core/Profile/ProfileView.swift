//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // Header
                ProfileHeaderView()
                
                // Post Grid View
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0...15, id: \.self) { _ in
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFill()
                            .background(.green)
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Sheet Button Pressed")
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}



//MARK: - Profile Hearder
fileprivate struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Picture and Status
            HStack {
                // Profile Pic
                Image(systemName: "house")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                // Posts
                ProfileStatusView(value: 3, title: "Postes")
                
                Spacer()
                
                // Followers
                ProfileStatusView(value: 400, title: "Followers")
                
                Spacer()
                
                // Following
                ProfileStatusView(value: 100, title: "Following")
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            
            // Username and Bio
            VStack(alignment: .leading, spacing: 4) {
                Text("Mohamed Khater")
                    .font(.headline)
                
                Text("Cairo | 23")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            
            HStack(spacing: 8) {
                // Edit Button
                Button {
                    print("Edit Profile Button Pressed")
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 32)
                        .foregroundColor(.black)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(UIColor.systemGray5))
                        }
                }
                
                // Share Button
                Button {
                    print("Share Profile Button Pressed")
                } label: {
                    Text("Share Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 32)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(UIColor.systemGray5))
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}
