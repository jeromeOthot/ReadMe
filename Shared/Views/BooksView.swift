//
//  BooksView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        let size: CGFloat? 
        var body: some View {
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

struct BookPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title, size: 30.0)
            Book.Image(title: "", size: 30.0)
            Book.Image(title: "🤓", size: 30.0)
        }
        
        
    }
}
