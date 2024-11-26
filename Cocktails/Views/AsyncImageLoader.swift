//
//  AsyncImageLoader.swift
//  Cocktails
//
//  Created by Josh Smith on 11/24/24.
//

import SwiftUI

struct AsyncImageLoader: View {
    let photoData: Data?
    let placeholderImage: Image
    let imageSize: CGSize

    @State private var image: Image?

    var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .clipShape(Circle())
            } else {
                placeholderImage
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.secondary)
                    .frame(width: imageSize.width, height: imageSize.height)
                    .clipShape(Circle())
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        guard let photoData = photoData else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            if let uiImage = UIImage(data: photoData)?.resized(to: imageSize) {
                let swiftUIImage = Image(uiImage: uiImage)
                DispatchQueue.main.async {
                    self.image = swiftUIImage
                }
            }
        }
    }
}


extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Choose the smaller ratio to ensure the image fits within the target size
        let scaleFactor = min(widthRatio, heightRatio)

        let newSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}
