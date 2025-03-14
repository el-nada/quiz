//
//  TriviaView.swift
//  quizz
//
//  Created by El hanafi on 12/03/2025.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    @Binding var navigationPath: NavigationPath // Accept the Binding
    
    var body: some View {
        if trivia_manager.isFinished{
            EndView(navigationPath: $navigationPath)
                .environmentObject(trivia_manager)
        }
        else {
            QuestionView(navigationPath: $navigationPath).environmentObject(trivia_manager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(navigationPath: .constant(NavigationPath()))
            .environmentObject(TriviaManager())
    }
}

