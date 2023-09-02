//
//  UserService.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


enum FirebaseDocument {
    case users
    case posts
    
    var name: String {
        switch self {
        case .users: return "users"
        case .posts: return "posts"
        }
    }
}


final class UserService {
    
    private var currentUser: User?
    
    
    // MARK: - Functions
    private func uploadDataForSignUpUser(uid: String, username: String, email: String) async throws {
        let user = User(id: uid, email: email, username: username)
        // Encode User
        let encodeUserData = try Firestore.Encoder().encode(user)
        
        // Save user as Collection
        try await Firestore.firestore().collection(FirebaseDocument.users.name).document(user.id).setData(encodeUserData)
        
        // Don't need to fetch user again
        currentUser = user
    }
    
    func fetchCurrentUserData(id userID: String) async {
        do {
            // Get Document Snapshot
            let snapshot = try await Firestore.firestore().collection(FirebaseDocument.users.name).document(userID).getDocument()
            
            // Decode User
            let user = try snapshot.data(as: User.self)
            
            
            currentUser = user
            
        } catch {
            print("UserService::loadUserData error: \(error.localizedDescription)")
        }
    }
    
    func updateData(for user: User) async throws {
        let userDocument = Firestore.firestore().collection(FirebaseDocument.users.name).document(user.id)
        
        let encodedUser = try Firestore.Encoder().encode(user)
        
        try await userDocument.updateData(encodedUser)
    }
    
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection(FirebaseDocument.users.name).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
