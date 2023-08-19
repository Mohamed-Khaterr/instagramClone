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
    private let profileImage: Image?
    private let size: ProfileImageSize
    
    init(imageURLString: String?, image: Image? = nil, size: ProfileImageSize) {
        self.profileImageURLString = imageURLString
        self.profileImage = image
        self.size = size
    }
    
    var body: some View {
        if let profileImageURLString = profileImageURLString {
            let url = URL(string: profileImageURLString)
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
            
        } else if let profileImage = profileImage {
            profileImage
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
        } else {
            Image(systemName: "person")
                .resizable()
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
        }
    }
}
