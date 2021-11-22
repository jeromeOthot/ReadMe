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
        HStack {
            Book.Image(title: book.title)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
        }
       
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book: Book("Mon titre", "moi"))
    }
}