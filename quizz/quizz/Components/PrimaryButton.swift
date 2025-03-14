//
//  Button.swift
//  quizz
//
//  Created by El hanafi on 09/03/2025.
//

import SwiftUI

struct PrimaryButton: View {
    var text : String
    
    
   var body: some View {
       Text(text) // Use Text instead of Button
           .padding()
           .frame(maxWidth: .infinity) // Make the button expand horizontally
           .background(Color(red: 49/255, green: 173/255, blue: 1))
           .cornerRadius(20)
           .foregroundColor(.white)
           .font(.system(size: 20, weight: .bold, design: .default))
           .shadow(radius: 8)
           .padding(20)
   }
}

struct ButtonPreviews: PreviewProvider{
    static var previews: some View {
        PrimaryButton(text:"Start")
    }
}
