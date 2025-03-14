//
//  ExitButton.swift
//  quizz
//
//  Created by El hanafi on 14/03/2025.
//

import SwiftUI

struct ExitButton: View {
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "xmark.circle.fill")
            }
            .font(.system(size: 30))
            .foregroundColor(Color (red: 49/255, green:173/255, blue:1))
            .background(Circle()
                .fill(Color(red: 1, green: 1, blue: 1))
                .frame(width: 30, height: 30)
                .shadow(radius: 2, x: -2, y: 4))
        }
            
    }
}

struct ExitButtonPreviews : PreviewProvider{
        static var previews: some View {
            ExitButton()
        }
    
}
