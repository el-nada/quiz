//
//  AnswerRow.swift
//  quizz
//
//  Created by El hanafi on 11/03/2025.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        
        HStack(){
            Text(answer.text)
                .frame(maxWidth:.infinity, alignment:.leading)
                .font(.system(size: 20, weight: .bold, design: .default))
            
            ZStack{
                Button {
                    if !trivia_manager.answerSelected{
                        isSelected.toggle()
                        trivia_manager.selectAnswer(answer: answer)
                    }
                    
                } label: {
                    Image(systemName: "circle")
                }
                .font(.system(size: 20))
                .opacity(isSelected ? 0 : 1)
                
                if isSelected{
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: answer.isCorrect ?
                              "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(answer.isCorrect ? .green : .red)
                    }
                    .font(.system(size: 20))
                }
            }
            
            
    
        }
        .padding()
        .foregroundColor(isSelected ? .gray : Color(red: 49/255, green: 173/255, blue: 1))
        .background(Color.white) // Add a background color for the shadow to be visible
        .cornerRadius(12) // Match the corner radius of the overlay
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? .gray : Color(red: 49/255, green: 173/255, blue: 1))
        )
        .shadow( color:  isSelected ? (answer.isCorrect ? .green.opacity(0.8) : .red.opacity(0.8) ) : .gray.opacity(0.8), radius: 5) // Add shading
        .padding(.horizontal)
        
        
        
    }
}

struct AnswerRowPreviews: PreviewProvider{
    static var previews: some View {
        
        AnswerRow(answer: Answer(text:"string", isCorrect:true))
        .environmentObject(TriviaManager())
    }
}
