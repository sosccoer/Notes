//
//  NoteView.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 2.03.24.
//

import SwiftUI

struct NoteView: View {
    @State var indexOfNote: Int?
    @State var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false){
                
                VStack {
                    
                    CustomTextEditor(text: $title, placeHolder: " Название заметки", minLengh: 40).bold()
                    Divider().background(.black).frame(height: 2)
                    CustomTextEditor(text: $text, placeHolder: " Основной текст", minLengh: 650)
                    Spacer()
                    
                }.padding(.horizontal,16)
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    
                    if let index = indexOfNote {
                        viewModel.deleteNote(note: viewModel.notes[index])
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }){
                    Image(systemName: "trash")
                }
            }
        }
        .onAppear{
            switch indexOfNote {
                
            case nil: break
            default: self.text = viewModel.notes[indexOfNote!].mainText
                self.title = viewModel.notes[indexOfNote!].titile
            }
        }
        .onDisappear{
            if title != "" {
                switch indexOfNote {
                case nil: let currentDate = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd:MM:yyyy"
                    let formattedDate = dateFormatter.string(from: currentDate)
                    
                    let note = NoteModel(titile: self.title, mainText: self.text, date: formattedDate)
                    viewModel.addNewNote(note: note)
                default:
                    let currentNote = viewModel.notes[indexOfNote!]
                    let note = NoteModel(id: currentNote.id , titile: title, mainText: text, date: currentNote.date)
                    
                    viewModel.updateNote(note: note)
                }
            }
        }
    }
}
