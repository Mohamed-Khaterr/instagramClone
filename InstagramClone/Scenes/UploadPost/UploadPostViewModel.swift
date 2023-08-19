//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation
import SwiftUI
import PhotosUI


@MainActor
final class UploadPostViewModel: ObservableObject {
    
    @Published var postImage: Image?
    @Published var selectedPostImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedPostImage) }}
    }
    
    private var uiPostImage: UIImage?
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else  {
                print("LoadImage from PhotoPicker error: Data is nil");
                return
            }
            
            if let uiImage = UIImage(data: data) {
                self.postImage = Image(uiImage: uiImage)
                self.uiPostImage = uiImage
            }
            
        } catch {
            print("LoadImage from PhotoPicker error: \(error)")
        }
    }
    
    func uploadPost(caption: String?) async throws {
        guard
            let user = AuthService.shared.currentUser,
            let userID = AuthService.shared.currentUser?.id,
            let uiPostImage = uiPostImage
        else { return }
        
        let post = Post(id: "", publisherUid: userID, publisher: user, caption: caption, imageURL: "", likes: 0, timestamp: Date())
    }
    
    func cancel() {
        postImage = nil
        selectedPostImage = nil
    }
}
