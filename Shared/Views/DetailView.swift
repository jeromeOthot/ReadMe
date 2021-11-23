//
//  DetailView.swift
//  ReadMe
//
//  Created by admin on 2021-11-22.
//
import PhotosUI.PHContentEditingController
import SwiftUI

struct DetailView: View {
    let book: Book
    @State var showDeletePopup = false
    @State var showingImagePicker = false
    @Binding var image: Image?
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .center) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title2)
                    .foregroundColor(.secondary)
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
              "Delete image for \(book.title)?",
              isPresented: $showDeletePopup) {
                Button("Delete", role: .destructive) { image = nil }
              } message: {
                Text("Delete image for \(book.title)?")
              }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book(), image: .constant(nil))
            .previewedAllColor
    }
}
