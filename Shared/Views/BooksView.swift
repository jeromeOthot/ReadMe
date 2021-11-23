//
//  BooksView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

extension Book {
    struct Image: View {
        let image: SwiftUI.Image?
        let title: String
        let size: CGFloat?
        let cornerRadius: CGFloat
        var body: some View {
            if let image = image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
            }
            else {
                let symbol = SwiftUI.Image(title: title)
                ?? .init(systemName: "book")
                
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary.opacity(0.5))
            }
        }
    }
}

extension Book.Image {
    init(title: String) {
        self.init(image: nil, title: title, size: nil, cornerRadius: .init())
    }
}

extension Image {
    init?(title: String){
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil
        else {
            return nil
        }
        
        
        self.init(systemName: symbolName)
    }
}

extension View {
    var previewedAllColor: some View {
        ForEach(
            ColorScheme.allCases, id:\.self,
            content: preferredColorScheme
        )
    }
}

struct BookPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "🤓")
        }
        .previewedAllColor
    }
    
}
