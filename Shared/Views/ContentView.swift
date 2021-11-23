//
//  ContentView.swift
//  Shared
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    var body: some View {
        NavigationView {
            List {
                Button {
                    
                }
                label: {
                    VStack(alignment: .center) {
                        Text("📙 Add new book !")
                            .font(.title2)
                    }
                }
                ForEach(library.sortedBooks) { book in
                    BookRowView(book: book, image: $library.images[book])
                }
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
