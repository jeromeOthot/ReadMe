//
//  SectionView.swift
//  ReadMe
//
//  Created by admin on 2021-11-23.
//

import SwiftUI

struct SectionView: View {
    let section: Section
    @EnvironmentObject var library: Library
    
    var title: String {
        switch section {
        case .toRead:
            return "Read me !"
        case .finished:
            return "Finished !"
        }
    }
    
    var body: some View {
        if let books = library.sortedBooks[section] {
            SwiftUI.Section {
                ForEach(books) { book in
                    BookRowView(book: book)
                }
            }
            header: {
                Text(title).font(.title2)
            }
        }
    }
}
