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
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    @Published var profileImage: Image?
    
    @Published var fullName: String = ""
    @Published var bio: String = ""
    
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
    
    func cancel() {
        profileImage = nil
        selectedImage = nil
    }
}
