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
                            NavigationLink( destination: NoteView( indexOfNote: index, viewModel: viewModel)){
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
                        
                        NavigationLink(destination: NoteView( indexOfNote: nil, viewModel: viewModel)) {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(Color(UIColor(named: "ToolBarSet")!))
                        }.padding(.trailing,16)
                        
                    }
                }
            }
        }.accentColor(Color(UIColor(named: "ToolBarSet")!))
            .onAppear{
                viewModel.getNotes()
                
            }
    }
}

#Preview {
    MainScreen()
}
