//
//  ViewModel.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 3.03.24.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var notes: [NoteModel] = []
    
    func createNewNote() {
        getNotes()
        let zeroModel = NoteModel(titile: "", mainText: "", date: "")
        self.notes.append(zeroModel)
    }
    
    func getNotes() {
        
    }
    
    func addNewNote(note: NoteModel){
        
        self.notes.append(note)
        
        // realm addNew File note
        //getNotes()
    }
    
}
