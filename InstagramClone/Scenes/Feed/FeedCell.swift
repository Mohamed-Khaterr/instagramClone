//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct FeedCell: View {
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    @State private var isLiked = false
    @State private var isSaved = false
    
    var body: some View {
        VStack(alignment: .center) {
            //MARK: - Username & pic
            HStack {
                // user pic
                CircularProfileImageView(imageURLString: nil, size: .small)
                
                // username
                NavigationLink(value: post.publisher) {
                    Text(post.publisher.username)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            
            
            //MARK: - Post Image
            Image(post.imageURL)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 520)
                .clipShape(Rectangle())
                .onTapGesture(count: 2) {
                    isLiked = true
                }
            
            
            
            //MARK: - Actions Buttons
            HStack(spacing: 16) {
                Button {
                    isLiked.toggle()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(isLiked ? .red : .black)
                        .frame(width: 20, height: 20)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Button {
                    isSaved.toggle()
                } label: {
                    Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .accentColor(.black)
            .padding(.horizontal)
            
            
            
            //MARK: - Likes & Caption & Date
            VStack(alignment: .leading, spacing: 4) {
                // Likes number
                Text("\(post.likes) Likes")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                // Caption Text
                HStack {
                    if let caption = post.caption {
                        // Username
                        Text("\(post.publisher.username) ").fontWeight(.semibold) +
                        
                        // Caption
                        Text(caption)
                    }
                }
                .font(.subheadline)
                
                // Date of publish
                Text("6h ago")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 8)
            
            
            // End
        }
        .frame(maxWidth: .infinity)
    }
}
