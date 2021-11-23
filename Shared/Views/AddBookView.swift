//
//  AddBookView.swift
//  ReadMe
//
//  Created by admin on 2021-11-23.
//

import SwiftUI
import PhotosUI.PHContentEditingController

struct AddBookView: View {
    @ObservedObject var book = Book(title:"", author:"")
    @State var showDeletePopup = false
    @State var showingImagePicker = false
    @State var image: Image? = nil
    @EnvironmentObject var library: Library
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top){
                VStack(alignment: .center) {
                    Button {
                        book.readMe.toggle()
                    }
                    label: {
                        Image(systemName: book.readMe ? "bookmark.fill" : "bookmark" )
                            .font(.system(size: 48, weight: .light))
                    }
                    TextField("Title:", text: $book.title)
                    TextField("Author:", text: $book.author)
                    Divider().padding(.vertical)
                    Book.Image(image: image, title: book.title, size: 150.0, cornerRadius: 16)
                    Spacer()

                    HStack {
                        Button("Update image") {
                            showingImagePicker = true;
                        }
                        if(image != nil){
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
                PHPickerViewController.View(image: $image)
            }
            .confirmationDialog(
                  "Delete image ?",
                  isPresented: $showDeletePopup) {
                    Button("Delete", role: .destructive) { image = nil }
                  } message: {
                    Text("Delete image ?")
                  }
              .navigationBarTitle("Got a new book ?")
              .toolbar {
                  ToolbarItem(placement: .status){
                      Button("Add new book") {
                          library.addNewBook(book, image)
                          dismiss()
                      }
                  }
              }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView().environmentObject(Library())
            .previewedAllColor
    }
}
