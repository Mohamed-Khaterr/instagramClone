//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation
import Firebase
import Combine

final class ContentViewModel: ObservableObject {
    
    private let authSevice = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isUserLoggedIn = false
    @Published var currentUser: User?
    
    init() {
        bind()
    }
    
    func bind() {
        // Subscribe to AuthService
        authSevice.$isAuthorized
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isAuthorized in
                guard let strongSelf = self else { return }
                strongSelf.isUserLoggedIn = isAuthorized
            }
            .store(in: &cancellables)
        
        authSevice.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                self?.currentUser = user
            }
            .store(in: &cancellables)
    }
}
