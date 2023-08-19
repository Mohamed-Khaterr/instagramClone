//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Khater on 7/22/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @StateObject var viewModel = UploadPostViewModel()
    
    @State private var imagePickerPresented = false
    @State private var caption: String = ""
    @Binding var selectedTab: Int
    @State private var tabBarVisibility: Visibility = .visible

    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    if let image = viewModel.postImage {
                        // Selected image from PhotoPicker
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 400)
                            .clipped()
                            .overlay {
                                Button {
                                    imagePickerPresented.toggle()
                                } label: {
                                    Text("Photos")
                                        .font(.footnote)
                                }
                                .foregroundColor(.black)
                                .padding(8)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding()
                            }
                        
                    } else {
                        // Show Photo Picker
                        Button("Select Photo") {
                            imagePickerPresented.toggle()
                        }
                        .frame(maxWidth: .infinity, minHeight: 400)
                        .background(Color(.systemGray6))
                    }
                    
                    
                    // Caption
                    TextField("Caption...", text: $caption, axis: .vertical)
                        .padding()
                    
                    Spacer()
                }
                .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedPostImage)
                
                
                
            }
            // Navigation Bar
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(tabBarVisibility, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        print("Share Button Pressed")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.cancel()
                        caption = ""
                        selectedTab = 0
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                    }
                }
            }
            
            // Life Cycle
            .onAppear {
                tabBarVisibility = .hidden
            }
            .onDisappear {
                tabBarVisibility = .visible
            }
        }
    }
}
