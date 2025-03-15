//
//  Background.swift
//  quizz
//
//  Created by El hanafi on 15/03/2025.
//

import SwiftUI

struct Background: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color( red: 220 / 255, green: 241 / 255, blue: 1), Color( red: 127 / 255, green: 204 / 255, blue: 1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .ignoresSafeArea()
    }
}

struct BackgroundPreview : PreviewProvider{
    static var previews: some View {
        Background()
    }
}
