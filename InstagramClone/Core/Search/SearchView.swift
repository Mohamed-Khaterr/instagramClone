//
//  SearchView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<15) { i in
                        let image = (i % 2 == 0) ? "img1" : "img2"
                        SearchCell(image: image, username: "mohamed.khaterr", name: "Mohamed Khater")
                    }
                }
                .padding(.top)
                .frame(maxWidth: .infinity)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

fileprivate struct SearchCell: View {
    
    private let image: String
    private let username: String
    private let name: String
    
    init(image: String, username: String, name: String) {
        self.image = image
        self.username = username
        self.name = name
    }
    
    var body: some View {
        HStack {
            // user pic
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                // username
                Text(username)
                    .fontWeight(.semibold)
                
                // name
                Text(name)
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}
