//
//  Button.swift
//  quizz
//
//  Created by El hanafi on 09/03/2025.
//

import SwiftUI

struct PrimaryButton: View {
    var text = "Start"
    var body: some View {
        Button(text) {
        }
        .padding()
        .background(Color(red: 49/255, green:173/255, blue:1))
        .cornerRadius(20)
        .foregroundColor(.white)
        .font(.system(size: 20, weight: .bold, design: .default))
        .shadow(radius: 8)
        
        
                    
    }
}

struct ButtonPreviews: PreviewProvider{
    static var previews: some View {
        PrimaryButton()
    }
}
