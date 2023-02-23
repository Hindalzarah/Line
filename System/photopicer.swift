//
//  photopicer.swift
//  Line
//
//  Created by Raniyah Alotaibi on 26/07/1444 AH.
//

import SwiftUI
import PhotosUI
import Firebase

struct photopicer: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
                
                Image(systemName: "plus")
                Text("Upload Company logo ")
                
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
        
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
               .frame(width: 400.0, height:400)
                .clipShape(Circle())
                .frame(width: 400, height: 400)
//                    .padding(.top,-10)
//                    .padding(.bottom,-10)
        }
    }
}

struct photopicer_Previews: PreviewProvider {
    static var previews: some View {
        photopicer()
    }
}
