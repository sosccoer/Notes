//
//  RealmWorker.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 5.03.24.
//

import Foundation
import RealmSwift

class RealmWorker: ObservableObject {
    
    private let realm = try! Realm()
    
    func add( notes: [NoteModel]) {
        
        for note in notes {
            let noteRealm = NoteRealm()
            noteRealm.id = note.id
            noteRealm.date = note.date
            noteRealm.mainText = note.mainText
            noteRealm.title = note.titile
            
            do {
                try realm.write {
                    realm.add(noteRealm, update: .modified)
                }
            } catch {
                print("Error saving note: \(error)")
            }
        }
        
    }
    
    func getAllNotes() -> [NoteModel] {
        let realmModels = Array(realm.objects(NoteRealm.self))
        var notes: [NoteModel] = []
        for model in realmModels {
            let noteModel = NoteModel(id: model.id, titile: model.title, mainText: model.mainText, date: model.date)
            notes.append(noteModel)
        }
        return notes
    }
    
    func updateNote(note: NoteModel) {
        
        let realmNotes = realm.objects(NoteRealm.self)
        
        for (index, realmNote) in realmNotes.enumerated()  {
            if realmNote.id == note.id{
                try! realm.write{
                    realmNotes[index].mainText = note.mainText
                    realmNotes[index].title = note.titile
                }
            }
        }
    }
    
    func deleteAllNotes() {
        do {
            try realm.write {
                realm.delete(realm.objects(NoteRealm.self))
            }
        } catch {
            print("Error deleting all notes: \(error)")
        }
    }
    
    func deleteOne(note:NoteModel){
        
        let realmNotes = realm.objects(NoteRealm.self)
        
        for (index, realmNote) in realmNotes.enumerated()  {
            
            if realmNote.id == note.id{
                try! realm.write{
                    
                    realm.delete(realmNotes[index])
                    
                }
            }
            
        }
        
    }
    
    
}

