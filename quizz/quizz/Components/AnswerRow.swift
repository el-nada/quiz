//
//  AnswerRow.swift
//  quizz
//
//  Created by El hanafi on 11/03/2025.
//

import SwiftUI

struct AnswerRow: View {
    var answer: String
    
    var body: some View {
        
        HStack(){
            Text(answer)
                .frame(maxWidth:.infinity, alignment:.leading)
                .font(.system(size: 20, weight: .bold, design: .default))
                
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "circle")
            }
            .font(.system(size: 20))
    
        }
        .padding()
        
        .foregroundColor(Color( red: 49 / 255, green: 173 / 255, blue: 1))
        .overlay( RoundedRectangle(cornerRadius: 12)
            .stroke(Color(Color (red: 49/255, green:173/255, blue:1))))
        .padding(.horizontal)
        
        
    }
}

struct AnswerRowPreviews: PreviewProvider{
    static var previews: some View {
        AnswerRow(answer: "Paris")
    }
}
