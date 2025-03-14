//
//  TriviaManager.swift
//  quizz
//
//  Created by El hanafi on 13/03/2025.
//

import Foundation
import Combine

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var score = 0
    @Published private(set) var isFinished = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0
    @Published private(set) var isLoading = false // Track loading state
    @Published private(set) var errorMessage: String? // Track errors
    
    @MainActor
    func fetchTrivia() async {
        guard !isLoading else { return } // Avoid multiple simultaneous fetches
        
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=10") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        do {
            // Delay to reduce chance of hitting rate limits
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Debug: Print response status code and data
            guard let httpResponse = response as? HTTPURLResponse else {
                errorMessage = "Invalid response type"
                isLoading = false
                return
            }
            print("Status code: \(httpResponse.statusCode)")
            print("Response data: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
            
            guard httpResponse.statusCode == 200 else {
                errorMessage = "Invalid status code \(httpResponse.statusCode)"
                isLoading = false
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            // Debug: Print raw JSON data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON data: \(jsonString)")
            }
            
            // Decode the data
            let decodedData = try decoder.decode(Trivia.self, from: data)
            print("Decoded data: \(decodedData)")
            
            // Update state on the main thread
            await MainActor.run {
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
                self.isLoading = false
            }
            
            print("Trivia fetched: \(self.trivia)")
            print("Number of questions: \(self.length)")
            if !self.trivia.isEmpty {
                print("First question: \(self.trivia[0].formattedQuestion)")
            }
            
        } catch {
            await MainActor.run {
                errorMessage = "Error while fetching data: \(error.localizedDescription)"
                print("Decoding error: \(error)")
                isLoading = false
            }
        }
    }
    
    
    func nextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            isFinished = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat((Double(index) + 1) / Double(length)) * 280
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        if answer.isCorrect {
            score += 1
        }
        answerSelected = true
    }
    
    func resetQuiz() {
        trivia = []
        length = 0
        index = 0
        score = 0
        isFinished = false
        answerSelected = false
        question = ""
        answerChoices = []
        progress = 0
    }
}
