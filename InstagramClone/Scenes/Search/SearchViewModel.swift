//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import Foundation


final class SearchViewModel: ObservableObject {
    
    let service = UserService()
    
    @Published var users = [User]()
    
    init() {
        Task { await fetchAllUsers() }
    }
    
    
    @MainActor func fetchAllUsers() async {
        do {
            users = try await service.fetchAllUsers()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
