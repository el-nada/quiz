//
//  TriviaView.swift
//  quizz
//
//  Created by El hanafi on 12/03/2025.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    var body: some View {
        QuestionView().environmentObject(trivia_manager)
    }
}

struct TriviaViewPreview : PreviewProvider {
    static var previews: some View {
        TriviaView().environmentObject(TriviaManager())
    }
}
