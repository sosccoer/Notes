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
    @State var minLengh: CGFloat
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    if text.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(.black)
                            .padding(.leading,8)
                            .padding(.top,8)
                        Spacer()
                    }
                }
                Spacer()
            }
            TextEditor( text: $text)
                .frame(minHeight: minLengh)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .opacity(0.8)
        }
    }
}
