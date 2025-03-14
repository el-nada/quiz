//
//  EndView.swift
//  quizz
//
//  Created by El hanafi on 14/03/2025.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    @Binding var navigationPath: NavigationPath // Accept the Binding
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(
                    Color( red: 220 / 255, green: 241 / 255, blue: 1))
            VStack{
                Spacer()
                
                ZStack{
                    Circle()
                        .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1).opacity(0.3))
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    Circle()
                        .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1).opacity(0.3))
                        .frame(width: 180, height: 180)
                        .padding()
                    
                    Circle()
                        .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1).opacity(0.3))
                        .frame(width: 150, height: 150)
                        .padding()
                    
                    Circle()
                        .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1).opacity(0.3))
                        .frame(width: 150, height: 150)
                        .padding()
                    
                    Text(" \(trivia_manager.score*100) pts")
                        .font(.system(size: 36, weight: .bold, design: .default))
                        .foregroundColor(
                            Color( red: 220 / 255, green: 241 / 255, blue: 1))
                }
                Spacer()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 12).foregroundColor(
                        Color( red: 220 / 255, green: 241 / 255, blue: 1))
                    .frame(width: .infinity, height: 200, alignment: .center)
                    .shadow(radius: 7)
                    .padding(.horizontal, 20)
                    
                    VStack{
                        HStack{
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 10))
                                    
                                    Text("\(trivia_manager.length > 0 ? (trivia_manager.answered * 100) / trivia_manager.length : 0)%").font(.system(size: 20, weight: .bold, design: .default))
                                }
                                
                                Text("Completion").font(.system(size: 15)).padding(.leading, 20)
                                
                            }
                            .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 10))
                                    
                                    Text("\(trivia_manager.length)").font(.system(size: 20, weight: .bold, design: .default))
                                }
                                
                                Text("Total questions").font(.system(size: 15)).padding(.leading, 20)
                                
                            }
                            .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                        }
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        
                        
                        HStack{
                                
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "circle.fill")
                                    .font(.system(size: 10))
                                    
                                    Text("\(trivia_manager.score)").font(.system(size: 20, weight: .bold, design: .default))
                                }
                                .foregroundColor(Color(.green))
                                Text("Correct").font(.system(size: 15)).padding(.leading, 20)
                                
                            }
                            .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "circle.fill")
                                    .font(.system(size: 10))
                                    
                                    Text("\(trivia_manager.answered-trivia_manager.score)").font(.system(size: 20, weight: .bold, design: .default))
                                }
                                .foregroundColor(Color(.red))
                                Text("Wrong               ").font(.system(size: 15)).padding(.leading, 20)
                                
                                }
                            .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                            }
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                        
                    }
                    
                }
                Spacer()
                
                HStack{
                    
                    VStack{
                        Button{
                            navigationPath = NavigationPath()
                            trivia_manager.resetQuiz()
                        }label: {
                            Image(systemName: "house.circle.fill")
                                .font(.system(size: 40))
                                
                        }
                        
                        Text("Home").font(.system(size: 20, weight:.bold, design: .default))
                    }
                    .padding()
                    .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                    
                    VStack(alignment: .center){
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
                                    trivia_manager.resetQuiz()
                                    navigationPath.append("TriviaView") // Trigger navigation
                                }
                            } label: {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.system(size: 40))
                            }
                            Text("Play Again").font(.system(size: 20, weight:.bold, design: .default))
                        }
                        
                        
                    }
                    .padding()
                    .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                    
                    VStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "eye.circle.fill")
                                .font(.system(size: 40))
                                
                        }
                        
                        Text("Anwers").font(.system(size: 18, weight:.bold, design: .default))
                    }
                    .padding()
                    .foregroundColor(Color(red: 49/255, green: 173/255, blue: 1))
                    
                }.padding(20)
               
                Spacer()
                
            }
        }
    }
}


struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView(navigationPath: .constant(NavigationPath()))
            .environmentObject(TriviaManager())
    }
}
