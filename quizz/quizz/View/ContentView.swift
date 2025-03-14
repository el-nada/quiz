//
//  ContentView.swift
//  quizz
//
//  Created by El hanafi on 08/03/2025.
//

import SwiftUI
struct ContentView: View {
    @StateObject var trivia_manager = TriviaManager()
    @State private var navigationPath = NavigationPath() // For programmatic navigation
    @State private var playerName: String = "" // State variable for player name
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Color(red: 220/255, green: 241/255, blue: 1))
                        
                        VStack {
                            Spacer()
                            
                            Text("IQUIZ")
                                .font(.system(size: 50, weight: .bold, design: .default))
                                .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                            /*
                            If i want to add player's name for leaderboard
                            Spacer()
                            Spacer()
                            
                            
                             VStack {
                                Text("Enter your name:")
                                    .font(.system(size: 30, weight: .bold, design: .default))
                                    .foregroundColor(Color(red: 108/255, green: 196/255, blue: 1))
                                
                                Input(placeholder: "Name")
                            }
                            
                            Spacer()
                             */
                            
                            if trivia_manager.isLoading {
                                ProgressView("Loading...")
                                    .foregroundColor(Color(red: 108/255, green: 196/255, blue: 1))
                                    .padding()
                            } else if let errorMessage = trivia_manager.errorMessage {
                                Text("Error: \(errorMessage)") // Show error message if any
                                    .foregroundColor(.red)
                                    .padding()
                            } else {
                                Button {
                                    Task {
                                        await trivia_manager.fetchTrivia() // Fetch data
                                        navigationPath.append("TriviaView") // Trigger navigation
                                    }
                                } label: {
                                    PrimaryButton(text: "Start")
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    .navigationDestination(for: String.self) { destination in
                        if destination == "TriviaView" {
                            TriviaView(navigationPath: $navigationPath)
                                .navigationBarHidden(true)
                                .environmentObject(trivia_manager)
                        }
                    }
        }
    }
}   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
