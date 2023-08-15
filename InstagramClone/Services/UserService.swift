//
//  UserService.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import Foundation
import Firebase


struct UserService {
    
    func fetchAllUsers() async throws -> [User] {
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        } catch {
            throw error
        }
    }
    
    
    func updateData(for user: User) async throws {
        do {
            let userDocument = Firestore.firestore().collection("users").document(user.id)
            
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await userDocument.updateData(encodedUser)
        } catch {
            throw error
        }
    }
}
