//
//  NoteModel.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 22.02.24.
//

import Foundation
import RealmSwift

struct NoteModel: Codable , Identifiable , Hashable {
    var id: String = UUID().uuidString
    var titile: String
    var mainText: String
    var date: String
}

class NoteRealm: Object,Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var mainText: String
    @Persisted var date: String
}
