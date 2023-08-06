//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation


@MainActor
final class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    
    func createUser() async throws {
        // Firebase has email and password validation :)
        try await AuthService.shared.createUser(email: email, username: username, password: password)
    }
}
