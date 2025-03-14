//
//  Trivia.swift
//  quizz
//
//  Created by El hanafi on 13/03/2025.
//

import Foundation

struct Trivia: Decodable {
    var responseCode: Int
    var results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
    
    struct Result: Decodable, Identifiable {
        var id = UUID() // Not part of the JSON
        var type: String
        var difficulty: String
        var category: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        enum CodingKeys: String, CodingKey {
            case type, difficulty, category, question
            case correctAnswer = "correct_answer"
            case incorrectAnswers = "incorrect_answers"
        }
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error formatting question: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let all = correct + incorrect
                return all.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
    
    
}
    
