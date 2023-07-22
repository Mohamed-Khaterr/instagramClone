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
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    @Published var image: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else  {
                print("LoadImage from PhotoPicker error: Data is nil");
                return
            }
            
            if let uiImage = UIImage(data: data) {
                self.image = Image(uiImage: uiImage)
            }
            
        } catch {
            print("LoadImage from PhotoPicker error: \(error)")
        }
    }
    
    func cancel() {
        image = nil
        selectedImage = nil
    }
}
