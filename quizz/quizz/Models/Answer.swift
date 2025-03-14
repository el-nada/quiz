//
//  Answer.swift
//  quizz
//
//  Created by El hanafi on 13/03/2025.
//

import Foundation

struct Answer : Identifiable{
    var id = UUID()
    var text : AttributedString
    var isCorrect : Bool
    
}
