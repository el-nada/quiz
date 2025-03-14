//
//  QuestionView.swift
//  quizz
//
//  Created by El hanafi on 10/03/2025.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    @Binding var navigationPath: NavigationPath // Accept the Binding
    
    var body: some View {
        
        ZStack{
            Background()
            
            VStack{
                HStack{
                    Button {
                        trivia_manager.viewAnswer = false
                        navigationPath = NavigationPath()
                        trivia_manager.resetQuiz()
                    } label: {
                        ExitButton()
                    }
                    
                    ProgressBar(progress: trivia_manager.progress, level: trivia_manager.index+1, totalLevels: trivia_manager.length)
                }
                
                QuestionRow(question : trivia_manager.question, time:true)
                Spacer()
                
                ForEach(trivia_manager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: Answer(text: answer.text, isCorrect: answer.isCorrect))
                        .environmentObject(trivia_manager)
                }
                
                
                VStack {
                    Spacer() // Pushes the button to the bottom
                    
                    Button {
                        trivia_manager.nextQuestion()
                    } label: {
                        PrimaryButton(text: "Next")
                    }
                    .padding(.bottom, 5) // Add padding at the bottom
                }
                
            }
            
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(navigationPath: .constant(NavigationPath()))
            .environmentObject(TriviaManager())
    }
}
