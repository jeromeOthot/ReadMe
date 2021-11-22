//
//  DetailView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        Book.Image(title: book.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
    }
}
