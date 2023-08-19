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
    
    private let imageService = ImageService()
    
    private var uiPostImage: UIImage?
    
    @Published var postImage: Image?
    @Published var selectedPostImageItem: PhotosPickerItem? {
        didSet {
            Task { await loadImageFromPhotos() }
        }
    }
    
    
    @MainActor private func loadImageFromPhotos() async {
        if let uiImage = await imageService.loadImageFromPhotos(item: selectedPostImageItem) {
            uiPostImage = uiImage
            postImage = Image(uiImage: uiImage)
        }
    }
    
    
//    func uploadPost(caption: String?) async throws {
//        guard
//            let user = AuthService.shared.currentUser,
//            let userID = AuthService.shared.currentUser?.id,
//            let uiPostImage = uiPostImage
//        else { return }
//
//        let post = Post(id: "", publisherUid: userID, publisher: user, caption: caption, imageURL: "", likes: 0, timestamp: Date())
//    }
    
    func cancel() {
        postImage = nil
        selectedPostImageItem = nil
    }
}
