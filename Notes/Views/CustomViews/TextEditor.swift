//
//  TextEditor.swift
//  Notes
//
//  Created by lelya.rumynin@gmail.com on 5.03.24.
//

import Foundation
import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    @State var placeHolder: String
    var body: some View {
        ZStack{
            HStack{
                if text.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.black)
                        .padding(.leading,8)
                    Spacer()
                }
            }
            TextEditor( text: $text)
                .frame(minHeight: 40)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .border(.red)
                .opacity(0.8)
        }
    }
}
