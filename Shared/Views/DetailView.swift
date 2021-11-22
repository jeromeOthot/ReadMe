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
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Book.Image(title: book.title, size: .none)
            }
            .padding(.top, 0.0)
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
    }
}
