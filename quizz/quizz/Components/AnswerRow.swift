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
                .frame(maxWidth:300, alignment:.leading)
                .font(.system(size: 20, weight: .bold, design: .default))
            
            ZStack{
                
                Image(systemName: "circle")
                    .font(.system(size: 20))
                    .opacity(isSelected ? 0 : 1)
                
                if (isSelected || trivia_manager.viewAnswer){
                    Button {
                    
                    } label: {
                        Image(systemName: answer.isCorrect ?
                              "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(answer.isCorrect ? .green : .red)
                    }
                    .font(.system(size: 20))
                }
            }
            
            
    
        }
        .contentShape(Rectangle()) // Make the entire area tappable
            .onTapGesture {
                if (!trivia_manager.answerSelected && !trivia_manager.viewAnswer){
                    isSelected.toggle()
                    trivia_manager.selectAnswer(answer: answer)
                }
            }
            .padding()
            .foregroundColor(isSelected ? .gray : Color(red: 49/255, green: 173/255, blue: 1))
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? .gray : Color(red: 49/255, green: 173/255, blue: 1))
            )
            .shadow(
                color: {
                        if trivia_manager.viewAnswer {
                            // Show green/red based on correctness when answers are visible
                            answer.isCorrect ? .green.opacity(0.8) : .red.opacity(0.8)
                        } else {
                            // Default behavior: blue if selected, gray otherwise
                            isSelected ? (answer.isCorrect ? .green.opacity(0.8) : .red.opacity(0.8)) : Color(red: 49 / 255, green: 173 / 255, blue: 1).opacity(0.8)
                        }
                    }(),
                    radius: 5
                )
            .padding(.horizontal)
    }
}

struct AnswerRowPreviews: PreviewProvider{
    static var previews: some View {
        
        AnswerRow(answer: Answer(text:"string", isCorrect:true))
        .environmentObject(TriviaManager())
    }
}
