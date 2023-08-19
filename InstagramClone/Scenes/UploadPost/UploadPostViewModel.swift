//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase


@MainActor
final class UploadPostViewModel: ObservableObject {
    
    private let imageService = ImageService()
    
    @Published var isLoading = false
    
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
    
    
    func uploadPost(caption: String?) async throws {
        isLoading = true
        
        guard
            let user = AuthService.shared.currentUser,
            let uiPostImage = uiPostImage
        else { return }

        
        let postDoc = Firestore.firestore().collection("posts").document()
        guard let imageURL = try await imageService.uploadImage(uiPostImage, withPath: "post_images") else { return }
        let post = Post(id: postDoc.documentID,
                        owner: user,
                        caption: caption,
                        imageURL: imageURL,
                        likes: 0,
                        timestamp: Date())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postDoc.setData(encodedPost)
        
        isLoading = false
    }
    
    func cancel() {
        postImage = nil
        selectedPostImageItem = nil
    }
}
