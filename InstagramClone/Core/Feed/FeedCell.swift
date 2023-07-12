//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct FeedCell: View {
    
    @State private var isLiked = false
    @State private var isSaved = false
    
    let imageName: String
    
    var body: some View {
        VStack(alignment: .center) {
            //MARK: - Username & pic
            HStack {
                // user pic
                Image("img1")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                // username
                Button {
                    print("Username button pressed")
                } label: {
                    Text("mohamed.khaterr")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            
            
            //MARK: - Post Image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 520)
                .clipShape(Rectangle())
            
            
            
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
            
            
            
            //MARK: - Likes & Comments & Date
            VStack(alignment: .leading, spacing: 4) {
                // Likes number
                Text("\(23) Likes")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                // Comments Text
                HStack {
                    // Username
                    Text("username ").fontWeight(.semibold) +
                    
                    // Comment
                    Text("Gamed yas7by")
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
