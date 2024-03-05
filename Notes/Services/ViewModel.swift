//
//  ViewModel.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 3.03.24.
//

import Foundation

class ViewModel: ObservableObject{
    
    let realm = RealmWorker()
    @Published var notes: [NoteModel] = []
    
    func getNotes() {
        self.notes = realm.getAllNotes()
    }
    
    func addNewNote(note: NoteModel){
        
        self.notes.append(note)
        
        realm.add(notes: self.notes)
      
    }
    
    func updateNote(note: NoteModel) {
        realm.updateNote(note: note)
        getNotes()
    }
    
    func deleteAll() {
        realm.deleteAllNotes()
        getNotes()
    }
    
}
