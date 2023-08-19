//
//  SearchView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            SearchCell(user: user)
                        }
                    }
                }
                .padding(.top)
                .frame(maxWidth: .infinity)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

fileprivate struct SearchCell: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            // user pic
            CircularProfileImageView(imageURLString: user.profileImageURL, size: .small)
            
            VStack(alignment: .leading) {
                // username
                Text(user.username)
                    .fontWeight(.semibold)
                
                // full name
                if let fullName = user.fullName {
                    Text(fullName)
                }
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}
