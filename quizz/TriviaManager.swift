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
    @Published private(set) var category = 10
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var score = 0
    @Published private(set) var answered = 0
    @Published private(set) var isFinished = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var previousAnswers: [Answer] = [] // if i want to only show the wrong answers in answer view
    @Published private(set) var progress: CGFloat = 0
    @Published private(set) var isLoading = false // Track loading state
    @Published private(set) var errorMessage: String? // Track errors
    @Published var viewAnswer: Bool = false
    
    
    @MainActor
    func fetchTrivia() async {
        guard !isLoading else { return } // Avoid multiple simultaneous fetches
        
        isLoading = true
        errorMessage = nil
        guard let url = URL(string: ("https://opentdb.com/api.php?amount=10&category="+String(category))) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        let urlRequest = URLRequest(url: url)
        
        do {
            // Delay to reduce chance of hitting rate limits
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
            
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            // Decode the data
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            // Update state on the main thread
            DispatchQueue.main.async{
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
                self.isLoading = false
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
        answered += 1
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
        answered=0
    }
    
    func viewAnswers(){
        index = 0
        isFinished = false
        viewAnswer = true
        setQuestion()
    }
    
    func category(index:Int){
        category = index
    }
}
