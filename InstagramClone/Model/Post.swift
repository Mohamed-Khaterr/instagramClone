//
//  Post.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation


struct Post: Identifiable, Hashable, Codable {
    let id: String
    
    let publisherUid: String
    let publisher: User
    
    let caption: String?
    let imageURL: String
    var likes: Int
    let timestamp: Date
}


extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              publisherUid: NSUUID().uuidString,
              publisher: User.MOCK_USERS[0],
              caption: nil,
              imageURL: "img1",
              likes: 2,
              timestamp: Date()),
        
        .init(id: NSUUID().uuidString,
              publisherUid: NSUUID().uuidString,
              publisher: User.MOCK_USERS[1],
              caption: "New World",
              imageURL: "img2",
              likes: 23,
              timestamp: Date()),
        
        .init(id: NSUUID().uuidString,
              publisherUid: NSUUID().uuidString,
              publisher: User.MOCK_USERS[2],
              caption: "!!!",
              imageURL: "img1",
              likes: 1000,
              timestamp: Date()),
        
        .init(id: NSUUID().uuidString,
              publisherUid: NSUUID().uuidString,
              publisher: User.MOCK_USERS[3],
              caption: "No Caption :(",
              imageURL: "img2",
              likes: 15,
              timestamp: Date()),
        
            .init(id: NSUUID().uuidString,
                  publisherUid: NSUUID().uuidString,
                  publisher: User.MOCK_USERS[4],
                  caption: nil,
                  imageURL: "img1",
                  likes: 100,
                  timestamp: Date()),
    ]
}
