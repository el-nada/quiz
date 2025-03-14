//
//  QuestionRow.swift
//  quizz
//
//  Created by El hanafi on 11/03/2025.
//

import SwiftUI

struct QuestionRow: View {
    var question : AttributedString
    var time : DarwinBoolean
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color( red: 49 / 255, green: 173 / 255, blue: 1))
                .frame(width: .infinity, height: 150)
            
            Text(question)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(.top, 40.0)
                .padding(.leading)
                
            
        }.padding(20)
    }
}

struct QuestionRowPreviews : PreviewProvider{
        static var previews: some View {
            QuestionRow(question : "What is the capital of France ?", time:true)
        }
    
}
