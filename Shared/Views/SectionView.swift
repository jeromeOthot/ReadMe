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
                        .swipeActions(edge: .leading){
                            Button {
                                withAnimation {
                                    book.readMe.toggle()
                                    library.sortBooks()
                                }
                            }
                            label: {
                                book.readMe
                                ? Label("Finished", systemImage: "bookmark.slash")
                                : Label("Read me !", systemImage: "bookmark.slash")
                            }
                        }
                        .tint(.accentColor)
                        .swipeActions(edge: .trailing){
                            Button(role: .destructive) {
                                guard let index = books.firstIndex(where: { $0.id == book.id })
                                else { return }
                                
                                withAnimation() {
                                    library.deleteBooks(atOffset: .init(integer: index), section: section)
                                }
                            }
                            label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }//foreach
                .onDelete { indexSet in
                    library.deleteBooks(atOffset: indexSet, section: section)
                }
                .onMove { indexes, newOffset in
                    library.moveBook(oldOffset: indexes, newOffset: newOffset, section: section)
                }
                //LabelStyle(.iconOnly)
            }//section
            header: {
                Text(title).font(.title2)
            }
           
        }//if
    }//view
}//struct
