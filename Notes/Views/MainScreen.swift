//
//  ContentView.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 22.02.24.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var isPresented = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                List {
                    Section{
                        ForEach(Array(viewModel.notes.enumerated()), id: \.element){ index, note  in
                            NavigationLink( destination: NoteView(isPresented: $isPresented, indexOfNote: index, viewModel: viewModel)){
                                TitleCell(note: note)
                            }
                        }
                    }.padding(.horizontal,-8)
                    
                        .listSectionSeparator(.hidden)
                }.padding(.horizontal, -8)
                    .padding(.top,-16)
                
                ZStack{
                    
                    switch viewModel.notes.count {
                    case 1 : Text("\(viewModel.notes.count) заметка")
                    case 1..<5 : Text("\(viewModel.notes.count) заметки")
                    default : Text("\(viewModel.notes.count) заметок")
                    }
                   
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: NoteView(isPresented: $isPresented, indexOfNote: nil, viewModel: viewModel)) {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(.black)
                        }.padding(.trailing,16)
                        
                    }
                }
            }
        }.onAppear{
            viewModel.getNotes()
        }
    }
}


struct NoteView: View {
    @Binding var isPresented: Bool
    @State var indexOfNote: Int?
    @State var viewModel: ViewModel
    @State private var title: String = ""
    @State private var text: String = ""
    
    
    
    var body: some View {
        VStack {
            
            VStack {
                
                CustomTextEditor(text: $title)
                CustomTextEditor(text: $text)
                
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
            switch indexOfNote {
            case nil: let note = NoteModel(titile: self.title, mainText: self.text, date: "12:12")
                viewModel.addNewNote(note: note)
            default: viewModel.notes[indexOfNote!].titile = self.title
                viewModel.notes[indexOfNote!].mainText = self.text
            }
        }
        
    }
}

struct CustomTextEditor: View {
    @Binding var text: String
    var body: some View {
        TextEditor(text: $text)
            .frame(minHeight: 53)
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .border(.red)
    }
}

#Preview {
    MainScreen()
}
