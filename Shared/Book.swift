//
//  Book.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//

import Foundation

struct Book : Hashable {
    var author: String
    var title: String
    
    init(title: String = "an title", author: String = "an author") {
        self.title = title
        self.author = author
    }
}
