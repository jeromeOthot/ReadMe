//
//  DetailView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//
import PhotosUI.PHContentEditingController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @State var showDeletePopup = false
    @State var showingImagePicker = false
    @EnvironmentObject var library: Library
   // var image = library.images[book]
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .center) {
                Button {
                    book.readMe.toggle()
                }
                label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark" )
                        .font(.system(size: 48, weight: .light))
                }
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Divider().padding(.vertical)
                TextField("Book review:", text: $book.microReview)
                Divider().padding(.vertical)
                Book.Image(image: library.images[book], title: book.title, size: 150.0, cornerRadius: 16)
                Spacer()
         
                
                HStack {
                    Button("Update image") {
                        showingImagePicker = true;
                    }
                    if(library.images[book] != nil){
                        Spacer()
                        Button("Delete image") {
                            showDeletePopup = true;
                        }
                    }
                }
                
            }
            .padding(.top, 0.0)
        }.padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $library.images[book])
        }
        .confirmationDialog(
              "Delete image for \(book.title)?",
              isPresented: $showDeletePopup) {
                Button("Delete", role: .destructive) {  }
              } message: {
                Text("Delete image for \(book.title)?")
              }
              .onDisappear {
                  withAnimation {
                    library.sortBooks()
                  }
                  
              }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
            .previewedAllColor
    }
}
