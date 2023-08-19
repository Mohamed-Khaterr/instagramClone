//
//  User.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation


struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var profileImageURL: String?
    var fullName: String?
    var bio: String?
}


extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "mohamed@gmail.com", username: "mohamed.khater", profileImageURL: "img1", fullName: "Mohamed Khater", bio: "Cairo | 23"),
        .init(id: NSUUID().uuidString, email: "Ahmed@gmail.com", username: "ahmed.khater", profileImageURL: "img2", fullName: "Ahmed Khater", bio: "Cairo | 23"),
        .init(id: NSUUID().uuidString, email: "saad@gmail.com", username: "mohamed.saad", profileImageURL: "img1", fullName: "Mohamed Saad", bio: "Cairo | 23"),
        .init(id: NSUUID().uuidString, email: "aly@gmail.com", username: "aly.zoz", profileImageURL: nil, fullName: "Aly Abdelaziz", bio: "Cairo | 23"),
        .init(id: NSUUID().uuidString, email: "batman@gmail.com", username: "batman.super", profileImageURL: "img1", fullName: nil, bio: "Cairo | 23"),
    ]
}
