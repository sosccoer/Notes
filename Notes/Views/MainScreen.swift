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
        
        NavigationView{
            
            VStack {
                
                List {
                    Section{
                        ForEach(Array(viewModel.notes.enumerated()), id: \.element){ index, note  in
                            TitleCell(note: note).onTapGesture {
                                NoteView(isPresented: $isPresented, indexOfNote: index, viewModel: viewModel)
                            }
                        }
                    }.padding(.horizontal,-8)
                    
                        .listSectionSeparator(.hidden)
                }.padding(.horizontal, -8)
                    .padding(.top,-16)
                ZStack{
                    
                    Text("\(viewModel.notes.count) заметок")
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: NoteView(isPresented: $isPresented, viewModel: viewModel)){
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(.black)
                        }.padding(.trailing,16)
                    }.frame(height: 40)
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
    
    
    var body: some View {
        
        VStack {
            
            
            
        }
        
        
    }
}


#Preview {
    MainScreen()
}
