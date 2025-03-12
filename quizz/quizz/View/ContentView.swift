//
//  ContentView.swift
//  quizz
//
//  Created by El hanafi on 08/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(
                    Color( red: 220 / 255, green: 241 / 255, blue: 1))
            
            VStack{
                Spacer()
                Text("IQUIZ")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 49/255, green:173/255, blue:1))
                Spacer()
                Spacer()
                VStack{
                    Text("Enter your name :")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(Color(red:108/255,green:196/255, blue:1))
                    Input(placeholder: "Name")
                        
                }
                Spacer()
                PrimaryButton(text: "Start")
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
