//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Khater on 8/15/23.
//

import Foundation
import SwiftUI
import PhotosUI


final class EditProfileViewModel: ObservableObject {
    private let service = UserService()
    private let imageService = ImageService()
    private var user: User
    
    
    @Published var fullName: String
    @Published var bio: String
    @Published var isLoading = false
    
    
    @Published var selectedProfileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    private var uiSelectedProfileImage: UIImage?
    
    public var currentProfileImage: String? {
        return user.profileImageURL
    }
    
    
    init(user: User){
        self.user = user
        fullName = user.fullName ?? ""
        bio = user.bio ?? ""
    }
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else  {
                print("LoadImage from PhotoPicker error: Data is nil");
                return
            }
            
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.selectedProfileImage = Image(uiImage: uiImage)
                }
                self.uiSelectedProfileImage = uiImage
            }
            
        } catch {
            print("LoadImage from PhotoPicker error: \(error)")
        }
    }
    
    @MainActor func updateUserData() async throws {
        isLoading = true
        
        // update profile image if changed
        if let uiProfileImage = uiSelectedProfileImage {
            do {
                let imageURL = try await imageService.uploadImage(image: uiProfileImage)
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
