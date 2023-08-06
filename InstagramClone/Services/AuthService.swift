//
//  AuthService.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase


final class AuthService {
    
    static let shared = AuthService()
    
    
    // private (set) only this class can change it's value
    @Published private (set) var isAuthorized: Bool
    
    private var userSession: FirebaseAuth.User? {
        didSet{
            isAuthorized = (userSession != nil)
        }
    }
    
    
    private init() {
        userSession = Auth.auth().currentUser
        isAuthorized = (userSession != nil)
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            // Create User
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            // Save Username
            
        } catch {
            print("AuthService::Login error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(email: String, username: String, password: String) async throws {
        do {
            // Create User
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            // Save Username
            
        } catch {
            print("AuthService::createUser error: \(error.localizedDescription)")
            throw error
        }
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async throws {
        let user = User(id: uid, email: email, username: username)
        
        do {
            let encodedUser = try JSONEncoder().encode(user)
            let dictionary = try JSONSerialization.jsonObject(with: encodedUser, options: .allowFragments) as! [String: Any]
            try await Firestore.firestore().collection("users").document(user.id).setData(dictionary)
        } catch {
            throw error
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
            
        } catch {
            print(error)
            throw error
        }
    }
}
