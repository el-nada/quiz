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
    
    @State private var isAnimating = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
                    ZStack {
                        Background()
                        
                        VStack {
                            Spacer()
                            
                            
                            Image("Image")
                                .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150)
                                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                                            .rotationEffect(.degrees(isAnimating ? -10 : 10)) // Animation
                                            .animation(
                                                Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                                                value: isAnimating
                                            )
                                            .onAppear {
                                                isAnimating = true
                                            }
                            
                            Divider()
                                        .frame(height: 3)
                                        .background(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color(red: 49 / 255, green: 173 / 255, blue: 1), Color( red: 127 / 255, green: 204 / 255, blue: 1)]),
                                                startPoint: .trailing,
                                                endPoint: .leading
                                            )
                                        )
                                        .padding(.horizontal, 60)
                            
                            Text("IQUIZ")
                                        .font(.system(size: 50, weight: .bold, design: .rounded))
                                        .foregroundColor(Color(red: 49 / 255, green: 173 / 255, blue: 1))
                                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            Spacer()
                             
                            
                                Text("Test your knowledge with this app !")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                            
                                Button {
                                    Task {
                                        navigationPath.append("CategoryView") // Trigger navigation
                                    }
                                } label: {
                                    PrimaryButton(text: "Start")
                                }
                            
                            
                            Spacer()
                        }
                    }
                    .navigationDestination(for: String.self) { destination in
                        if destination == "CategoryView" {
                            CategoryView(navigationPath: $navigationPath)
                                .navigationBarHidden(true)
                                .environmentObject(trivia_manager)
                        }
                        else if destination == "TriviaView" {
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
