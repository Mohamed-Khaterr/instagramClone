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
    
    @Published private(set) var isAuthorized: Bool
    
    private var userSession: FirebaseAuth.User?
    
    
    // MARK: - init
    private init() {
        userSession = Auth.auth().currentUser
        isAuthorized = (userSession != nil)
    }
    
    
    
    // MARK: - Functions
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
        } catch {
            print("AuthService::Login error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(username: String, email: String, password: String) async throws {
        // Create User
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        userSession = nil
        isAuthorized = false
    }
    
    
//    private func uploadUserData(uid: String, username: String, email: String) async throws {
//        let user = User(id: uid, email: email, username: username)
//
//        do {
//            // Encode User
//            let encodeUserData = try Firestore.Encoder().encode(user)
//
//            // Save user as Collection
//            try await Firestore.firestore().collection(usersCollectionName).document(user.id).setData(encodeUserData)
//
//            // Don't need to fetch user again
//            currentUser = user
//
//        } catch {
//            print("AuthService::uploadUserData error: \(error.localizedDescription)")
//            throw error
//        }
//    }
//
//
//    func loadUserData() async {
//        guard let userID = userSession?.uid else { return }
//
//        do {
//            // Get Document Snapshot
//            let snapshot = try await Firestore.firestore().collection(usersCollectionName).document(userID).getDocument()
//
//            // Decode User
//            let user = try snapshot.data(as: User.self)
//            currentUser = user
//
//        } catch {
//            print("AuthService::loadUserData error: \(error.localizedDescription)")
//        }
//    }
}
