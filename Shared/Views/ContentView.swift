//
//  ContentView.swift
//  Shared
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.title) { book in
                BookRowView(book: book)
            }
            .navigationTitle("My Library")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
