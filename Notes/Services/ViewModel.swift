//
//  ViewModel.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 3.03.24.
//

import Foundation

class ViewModel: ObservableObject{
    
    
    
    @Published var notes: [NoteModel] = []
    
    func getNotes() {
        
        self.notes = [
        NoteModel(titile: "Моя первая заметка", mainText: "ну тут хуета какая-то", date: "12:02:2002")
        ]
        
    }
    
    func addNewNote(note: NoteModel){
        // realm addNew File note
        //getNotes()
    }
    
}
