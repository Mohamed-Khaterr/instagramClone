//
//  AuthService.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


/// Responsible for Login and SignUp and logout
final class AuthService {
    
    static let shared = AuthService()
    
    private let usersCollectionName = "users"
    
    // private (set) only this class can change it's value
    @Published private(set) var isAuthorized: Bool
    
    @Published private(set) var currentUser: User?
    
    private var userSession: FirebaseAuth.User? {
        didSet {
            isAuthorized = (userSession != nil)
        }
    }
    
    
    private init() {
        userSession = Auth.auth().currentUser
        isAuthorized = (userSession != nil)
        
        if isAuthorized {
            Task { await loadUserData() }
        }
    }
    
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            await loadUserData()
            
        } catch {
            print("AuthService::Login error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(username: String, email: String, password: String) async throws {
        do {
            // Create User
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            // Save Username & email
            try await uploadUserData(uid: result.user.uid, username: username, email: email)
            
        } catch {
            print("AuthService::createUser error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
            currentUser = nil
            
        } catch {
            print("AuthService::signOut error: \(error.localizedDescription)")
            throw error
        }
    }
    
    
    private func uploadUserData(uid: String, username: String, email: String) async throws {
        let user = User(id: uid, email: email, username: username)
        
        do {
            // Encode User
            let encodeUserData = try Firestore.Encoder().encode(user)
            
            // Save user as Collection
            try await Firestore.firestore().collection(usersCollectionName).document(user.id).setData(encodeUserData)
            
            // Don't need to fetch user again
            currentUser = user
            
        } catch {
            print("AuthService::uploadUserData error: \(error.localizedDescription)")
            throw error
        }
    }
    
    
    func loadUserData() async {
        guard let userID = userSession?.uid else { return }
        
        do {
            // Get Document Snapshot
            let snapshot = try await Firestore.firestore().collection(usersCollectionName).document(userID).getDocument()
            
            // Decode User
            let user = try snapshot.data(as: User.self)
            currentUser = user
            
        } catch {
            print("AuthService::loadUserData error: \(error.localizedDescription)")
        }
    }
}
