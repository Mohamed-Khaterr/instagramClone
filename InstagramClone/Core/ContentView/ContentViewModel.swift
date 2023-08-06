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
    
    init() {
        bind()
    }
    
    func bind() {
        // Subscribe to AuthService
        authSevice.$isAuthorized.sink { [weak self] isAuthorized in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.isUserLoggedIn = isAuthorized
            }
        }
        .store(in: &cancellables)
    }
}
