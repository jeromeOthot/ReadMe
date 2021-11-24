//
//  Library.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import Combine
import Foundation
import SwiftUI

enum Section : CaseIterable {
    case toRead
    case finished
}

class Library : ObservableObject {
    var sortedBooks: [Section: [Book]] {
        get {
            let groupedBooks = Dictionary(grouping: booksCache, by: \.readMe)
            return Dictionary(uniqueKeysWithValues: groupedBooks.map{
                (($0.key ? .toRead : .finished), $0.value )
            })
        }
        set {
            booksCache = newValue
                .sorted { $1.key == .finished }
                .flatMap { $0.value }
        }
    }
  
  /// An in-memory cache of the manually-sorted books.
    @Published private var booksCache: [Book] = [
      .init(title: "Ein Neues Land", author: "Shaun Tan"),
      .init(title: "Bosch", author: "Laurinda Dixon", microReview: "Earthily Delightful."),
      .init(title: "Dare to Lead", author: "Brené Brown"),
      .init(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet"),
      .init(title: "Drinking with the Saints", author: "Michael P. Foley", microReview: "One of Ozma's favorites! 😻"),
      .init(title: "A Guide to Tea", author: "Adagio Teas"),
      .init(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson", microReview: "Book too large for a micro-review!"),
      .init(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
      .init(title: "How to Draw Cats", author: "Janet Rancan"),
      .init(title: "Drawing People", author: "Barbara Bradley"),
      .init(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
    ]

    @Published var images: [Book: Image] = [:]
    
    func addNewBook(_ book: Book, _ image: Image?) {
        booksCache.insert(book, at: 0)
        images[book] = image
    }
    
    func moveBook(oldOffset: IndexSet, newOffset: Int, section: Section) {
        sortedBooks[section]?.move(fromOffsets: oldOffset, toOffset: newOffset)
    }
    
    func deleteBooks(atOffset offsets : IndexSet, section: Section) {
        let bookBefore = booksCache
        sortedBooks[section]?.remove(atOffsets: offsets)
        
        for change in booksCache.difference(from: bookBefore) {
            if case .remove(_, let deletedBook, _) = change {
                images[deletedBook] = nil
            }
        }
    }
    
    func sortBooks() {
        booksCache = sortedBooks
            .sorted { $1.key == .finished }
            .flatMap { $0.value }
        objectWillChange.send()
    }
}
