//
//  Timer.swift
//  quizz
//
//  Created by El hanafi on 11/03/2025.
//

import SwiftUI

struct Timer: View {
    let progress: CGFloat
    
    var body: some View {
        ZStack {
                    // Bottom semicircle (background)
                    GeometryReader { geometry in
                        Path { path in
                            let radius = min(geometry.size.width, geometry.size.height)/2 - 2
                            path.addArc(
                                center: CGPoint(x: geometry.size.width/2, y: geometry.size.height/2),
                                radius: radius,
                                startAngle: .degrees(0),
                                endAngle: .degrees(180),
                                clockwise: true
                            )
                        }
                        .stroke(.gray, lineWidth: 4)
                        
                        // Top semicircle (progress)
                        Path { path in
                            let radius = min(geometry.size.width, geometry.size.height)/2 - 2
                            path.addArc(
                                center: CGPoint(x: geometry.size.width/2, y: geometry.size.height/2),
                                radius: radius,
                                startAngle: .degrees(-90),
                                endAngle: .degrees(-90 + 180 * Double(progress)),
                                clockwise: false
                            )
                        }
                        .stroke(Color(red: 49/255, green:173/255, blue:1), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    }
                    
                    // Time text (centered)
                    Text("10s")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(red: 49/255, green:173/255, blue:1))
                }
                .padding()
            }
    
}

struct TimerPreviews : PreviewProvider{
        static var previews: some View {
            Timer(progress:8)
        }
    
}
