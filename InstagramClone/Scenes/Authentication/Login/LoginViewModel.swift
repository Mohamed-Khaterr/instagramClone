//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Khater on 8/6/23.
//

import Foundation


final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
