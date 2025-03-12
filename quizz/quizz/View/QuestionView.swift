//
//  QuestionView.swift
//  quizz
//
//  Created by El hanafi on 10/03/2025.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(
                    Color( red: 220 / 255, green: 241 / 255, blue: 1))
            
            VStack{
                
                ProgressBar(progress: 40, level: 1, totalLevels: 10)
                Spacer()
                QuestionRow(question : "What is the capital of France ?", time:true)
                Spacer()
                
                AnswerRow(answer: "Paris")
                AnswerRow(answer: "Lyon")
                AnswerRow(answer: "Paris")
                AnswerRow(answer: "Paris")
                
                Spacer()
                
                PrimaryButton(text:"Next")
                
                Spacer()
            }
        
        }
    }
}

    struct QuestionViewPreview : PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
}
