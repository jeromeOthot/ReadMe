//
//  Book.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import Foundation

struct Book {
    var author: String
    var title: String
    
    init(_ title: String = "an title", _ author: String = "an author") {
        self.title = title
        self.author = author
    }
}
