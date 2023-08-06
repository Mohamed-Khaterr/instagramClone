//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    private let isCurrentUser: Bool
    private let user: User
    
    init(isCurrentUser: Bool = false, user: User) {
        self.isCurrentUser = isCurrentUser
        self.user = user
    }
    
    var body: some View {
        VStack(spacing: 16) {
            //MARK: Profile Picture and Status
            HStack {
                // Profile Pic
                Image(user.getProfileImage())
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
            
            
            //MARK: FullName and Bio
            VStack(alignment: .leading, spacing: 4) {
                // Full name
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.headline)
                }
                
                // Bio
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            
            
            // MARK: Buttons
            if isCurrentUser {
                // Edit & Share Buttons
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
                
            } else {
                // Follow Button
                Button {
                    print("Follow Button Pressed")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 32)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
    }
}
