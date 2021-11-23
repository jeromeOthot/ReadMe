//
//  BookRowView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct BookRowView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book:book, image: $image), label: {
            HStack {
                Book.Image(image: image, title: book.title, size: 80.0, cornerRadius: 12)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title2)
                    Text(book.author)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text(book.microReview)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .lineLimit(1)
            }
            .padding()
        })
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book: Book(title: "Mon titre", author:"moi"), image: .constant(nil))
    }
}
