//
//  ContentView.swift
//  Shared
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: Library
    @State var addingNewbook = false;
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    addingNewbook = true
                }
                label: {
                    VStack(alignment: .center) {
                        Text("📙 Add new book !")
                            .font(.title2)
                    }
                }
                .sheet(isPresented: $addingNewbook, content:
                        AddBookView.init)
                
                ForEach(Section.allCases, id: \.self) {
                  SectionView(section: $0)
                }
                //ForEach(library.sortedBooks) { book in
                 //   BookRowView(book: book, image: $library.images[book])
                //}
            }
            .toolbar(content: EditButton.init)
            .navigationTitle("My Library")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
    }
}
