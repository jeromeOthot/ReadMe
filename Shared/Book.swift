//
//  Book.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import Foundation
import Combine
import SwiftUI

class Book: ObservableObject {
    let author: String
    let title: String
    @Published var microReview: String
    @Published var readMe: Bool
    
    init(title: String = "an title", author: String = "an author",  microReview: String = "", readMe: Bool = true) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readMe = readMe
    }
}

extension Book: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Book : Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }
}
