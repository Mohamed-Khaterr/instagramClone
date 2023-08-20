//
//  MainTabBarView.swift
//  InstagramClone
//
//  Created by Khater on 7/12/23.
//

import SwiftUI

struct MainTabBarView: View {
    
    let user: User
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            CurrentUserProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(2)
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView(user: User.MOCK_USERS[0])
    }
}
