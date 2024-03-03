//
//  NoteModel.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 22.02.24.
//

import Foundation

struct NoteModel: Codable , Identifiable , Hashable {
    
    var id = UUID()
    var titile: String
    var mainText: String
    var date: String
    
}
