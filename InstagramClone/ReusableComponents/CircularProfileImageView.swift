//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Khater on 8/19/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small: return 40
        case .large: return 90
        }
    }
}


struct CircularProfileImageView: View {
    private let profileImageURLString: String?
    private let size: ProfileImageSize
    
    @Binding private var profileImage: Image?
    
    init(imageURLString: String?, image: Binding<Image?>? = nil , size: ProfileImageSize) {
        self.profileImageURLString = imageURLString
        self._profileImage = image ?? Binding.constant(nil)
        self.size = size
    }
    
    var body: some View {
        if let profileImage = profileImage {
            // Image from Photos
            profileImage
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
            
        } else if let profileImageURLString = profileImageURLString {
            // Image from Firebas
            let url = URL(string: profileImageURLString)
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
            
        } else {
            // Default Image
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
        }
    }
}
