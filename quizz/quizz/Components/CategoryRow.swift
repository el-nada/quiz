//
//  CategoryRow.swift
//  quizz
//
//  Created by El hanafi on 15/03/2025.
//

import SwiftUI

struct CategoryRow: View {
    
    let category = ["Books", "Film", "Music", "Musicals & Theaters", "Television", "Video Games", "Board Games", "Science & Nature", "Computer", "Maths", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Comics"]
    let categoryIcons=["books.vertical.fill", "movieclapper.fill", "music.quarternote.3", "theatermasks.fill", "tv.fill", "gamecontroller.fill", "dice.fill", "atom", "keyboard.fill", "function", "wand.and.sparkles", "basketball.fill", "globe.europe.africa.fill", "hourglass", "eurosign.gauge.chart.lefthalf.righthalf", "paintbrush.pointed.fill", "person.bust.fill", "dog.fill", "car.fill", "book.fill"]
    
    var index : Int
    
    @State var isSelected : Bool = false
    @EnvironmentObject var trivia_manager : TriviaManager
    @Binding var navigationPath: NavigationPath // Accept the Binding
    
    var body: some View {
        
        if (trivia_manager.isLoading && isSelected) {
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color( red: 49 / 255, green: 173 / 255, blue: 1))
                    .frame(width: 160, height: 150)
                
                VStack(alignment: .leading){
                    HStack(alignment: .lastTextBaseline){
                        Image(systemName: categoryIcons[index])
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .padding(.top, 20)
                        Spacer()
                        ProgressView()
                            
                    }
                    .frame(width: 120)
                    
                    Text(category[index])
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.top)
                    
                    
                        
                }
                .foregroundColor(Color(red: 220 / 255, green: 241 / 255, blue: 1))
                .padding(.horizontal)
            }
            .padding()
            .shadow( color: Color(red: 49 / 255, green: 173 / 255, blue: 1).opacity(0.8), radius: 7) // Add shading
            .scaleEffect(isSelected ? 1.1 : 1) // Scale effect
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: isSelected)
            
        } else if let errorMessage = trivia_manager.errorMessage {
            Text("Error: \(errorMessage)") // Show error message if any
                .foregroundColor(.red)
                .padding()
        } else {
            
            Button{
                
                isSelected.toggle()
                trivia_manager.category(index:(index+10))
                print(trivia_manager.category)
                Task {
                    await trivia_manager.fetchTrivia() // Fetch data
                    navigationPath.append("TriviaView") // Trigger navigation
                }
                
                
            }label:{
                
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color( red: 49 / 255, green: 173 / 255, blue: 1))
                        .frame(width: 160, height: 150)
                    
                    VStack(alignment: .leading){
                        Image(systemName: categoryIcons[index])
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .padding(.bottom, 10)
                        
                        Text(category[index])
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                    .foregroundColor(Color(red: 220 / 255, green: 241 / 255, blue: 1))
                    .padding(.top, 20)
                    .padding(.horizontal)
                }
                .padding()
                .shadow( color: Color(red: 49 / 255, green: 173 / 255, blue: 1).opacity(0.8), radius: 7) // Add shading
                .scaleEffect(isSelected ? 1.1 : 1) // Scale effect
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: isSelected)
            }
        }
    }
}

struct CategoryRowPreview : PreviewProvider{
    static var previews: some View {
        CategoryRow(index:0, navigationPath: .constant(NavigationPath()))
            .environmentObject(TriviaManager())
    }
}
