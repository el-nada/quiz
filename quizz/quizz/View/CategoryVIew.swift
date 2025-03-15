//
//  CategoryVIew.swift
//  quizz
//
//  Created by El hanafi on 15/03/2025.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var trivia_manager : TriviaManager
    @Binding var navigationPath: NavigationPath // Accept the Binding

    var body: some View {
        ZStack{
            Background()
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Text("Let's play")
                        .padding(20)
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundColor(
                            Color( red: 49 / 255, green: 173 / 255, blue: 1))
                    
                    ForEach(Array(stride(from: 0, to: 20, by: 2)), id: \.self) { index in
                        
                        HStack{
                            CategoryRow(index: index, navigationPath: $navigationPath).environmentObject(trivia_manager)
                            
                            CategoryRow(index: index+1, navigationPath: $navigationPath).environmentObject(trivia_manager)
                        }
                        
                    }
                }
            }
        }
    }
}

struct CategoryViewPreviews:PreviewProvider{
    static var previews: some View {
        CategoryView(navigationPath: .constant(NavigationPath()))
            .environmentObject(TriviaManager())
    }
}
