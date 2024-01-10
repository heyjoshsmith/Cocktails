//
//  View.swift
//  Cocktails
//
//  Created by Josh Smith on 8/29/22.
//

import SwiftUI

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    func gradient(for cocktail: Cocktail) -> some View {
        self
            .background(
                LinearGradient(
                    colors: [
                        cocktail.category.color.opacity(0),
                        cocktail.category.color.opacity(0),
                        cocktail.category.color.opacity(0.25),
                        cocktail.category.color.opacity(0.5),
                        cocktail.category.color.opacity(0.75)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
    
    func cocktailButton(radius: CGFloat) -> some View {
            self
            .buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle(radius: radius))
            .hoverEffect()
    }
}
