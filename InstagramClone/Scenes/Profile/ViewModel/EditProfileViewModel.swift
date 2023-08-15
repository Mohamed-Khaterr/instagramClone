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
    private var user: User
    
    
    @Published var fullName: String
    @Published var bio: String
    
    
    @Published var profileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
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
                self.profileImage = Image(uiImage: uiImage)
            }
            
        } catch {
            print("LoadImage from PhotoPicker error: \(error)")
        }
    }
    
    @MainActor func updateUserData() async throws {
        // update profile image
        
        
        
        // Update FullName and Bio
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
    }
}
