//
//  BookRowView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct BookRowView: View {
    var book: Book
    var body: some View {
        NavigationLink(destination: DetailView(book:book), label: {
            HStack {
                Book.Image(title: book.title, size: 80.0)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title2)
                    Text(book.author)
                        .font(.title2)
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
        BookRowView(book: Book(title: "Mon titre", author:"moi"))
    }
}
