//
//  ContentView.swift
//  Shared
//
//  Created by admin on 2021-11-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BookRowView(book: Book("atest1", "moi"))
            BookRowView(book: Book("btest2", "moi2"))
            BookRowView(book: Book("ctest3", "moi3"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
