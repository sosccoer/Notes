//
//  TitleCell.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 22.02.24.
//

import SwiftUI

struct TitleCell: View {
    @State var note: NoteModel
    var body: some View {
        HStack{
            Text(note.titile)
                .padding(.vertical,8)
                .bold()
            Spacer(minLength: 16)
            Text(note.date)
        }
    }
}

#Preview {
    TitleCell(note: NoteModel(titile: "5 лайфхаков", mainText: "щыаптыщатывдатыоватыоваты", date: "12:02:2024" ))
}
