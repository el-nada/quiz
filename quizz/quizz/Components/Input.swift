//
//  input.swift
//  quizz
//
//  Created by El hanafi on 09/03/2025.
//

import SwiftUI

struct Input: View {
    var placeholder = "Name"
    
    var body: some View {
        TextField(placeholder, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Color(Color(red:108/255,green:196/255, blue:1).opacity(0.1)))
            .cornerRadius(20)
            .overlay( RoundedRectangle(cornerRadius: 20)
                .stroke(Color(Color(red:108/255,green:196/255, blue:1))).opacity(0.2))
            .padding(.horizontal, 32.0)
            
    }
}

struct InputPreviews: PreviewProvider{
    static var previews: some View {
        Input()
    }
}
