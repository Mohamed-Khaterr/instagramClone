//
//  ContentView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.isUserLoggedIn {
                if let currentUser = viewModel.currentUser{
                    MainTabBarView(user: currentUser)
                }
                
            } else {
                LoginView()
                    .environmentObject(RegistrationViewModel())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
