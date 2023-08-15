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
}
