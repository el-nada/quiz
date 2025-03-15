//
//  ProgressBar.swift
//  quizz
//
//  Created by El hanafi on 11/03/2025.
//

import SwiftUI

struct ProgressBar: View {
    var progress : CGFloat
    var level : Int
    var totalLevels : Int
    
    var body: some View {
            ZStack{
                
                HStack{
                    ZStack(alignment: .topLeading){
                        Rectangle()
                            .frame(width: 240, height: 8.0)
                            .foregroundColor(
                                Color( red: 220 / 255, green: 241 / 255, blue: 1))
                            .cornerRadius(20)
                            .overlay( RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(Color (red: 49/255, green:173/255, blue:1))).opacity(0.6))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color( red: 49 / 255, green: 173 / 255, blue: 1))
                            .frame(width: max(0, progress), height: 8.0)
                        
                    }.padding(.horizontal, 10)
                    
                    
                    Text (String(level)+"/"+String(totalLevels))
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 49/255, green:173/255, blue:1))
                        .padding(.trailing, 10.0)
                }
        }
                    
    }
}

struct ProgressBarPreviews: PreviewProvider{
    static var previews: some View {
        ProgressBar(progress: 40, level: 1, totalLevels: 10)
    }
}
