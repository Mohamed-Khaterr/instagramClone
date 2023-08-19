//
//  ImageService.swift
//  InstagramClone
//
//  Created by Khater on 8/19/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage


struct ImageService {
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.0) else { return nil }
        let filename = UUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename).jpeg")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            
            return url.absoluteString
            
        } catch {
            throw error
        }
    }
}
