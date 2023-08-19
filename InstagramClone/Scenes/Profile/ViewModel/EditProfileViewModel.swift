//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Combine


final class EditProfileViewModel: ObservableObject {
    private let service = UserService()
    private let imageService = ImageService()
    private var user: User
    
    
    @Published var fullName: String
    @Published var bio: String
    @Published var isLoading = false
    
    private var uiProfileImage: UIImage?
    @Published var profileImage: Image?
    @Published var profileImageItem: PhotosPickerItem? {
        didSet {
            Task { await loadImageFromPhotos() }
        }
    }
    
    public var currentProfileImage: String? {
        return user.profileImageURL
    }
    
    
    init(user: User){
        self.user = user
        fullName = user.fullName ?? ""
        bio = user.bio ?? ""
    }
    
    @MainActor func loadImageFromPhotos() async {
        if let uiimage = await imageService.loadImageFromPhotos(item: profileImageItem) {
            profileImage = Image(uiImage: uiimage)
            uiProfileImage = uiimage
        }
    }
    
    
    @MainActor func updateUserData() async throws {
        isLoading = true
        
        // update profile image if changed
        if let uiProfileImage = uiProfileImage {
            do {
                let imageURL = try await imageService.uploadImage(uiProfileImage, withPath: "profile_images")
                user.profileImageURL = imageURL
                try await service.updateData(for: user)
                
                await AuthService.shared.loadUserData()
                
            } catch {
                throw error
            }
        }
        
        
        
        // Update FullName and Bio if changed
        if user.fullName != fullName || user.bio != bio {
            user.fullName = fullName
            user.bio = bio
            do {
                try await service.updateData(for: user)
                
                await AuthService.shared.loadUserData()
                
            } catch {
                throw error
            }
        }
        
        isLoading = false
    }
}
