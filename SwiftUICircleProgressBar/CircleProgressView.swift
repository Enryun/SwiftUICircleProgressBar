//
//  CircleProgressView.swift
//  SwiftUICircleProgressBar
//
//  Created by James Thang on 05/08/2022.
//

import SwiftUI

struct CircleProgressBar: View {
    
    @State var progress: Float = 0
    var currentProgress: Float
    
    var color: Color {
        
        var colorCircle = Color.red
        
        if currentProgress >= 0.6 {
            colorCircle = Color.green
        } else if currentProgress >= 0.45 {
            colorCircle = Color.blue
        } else if currentProgress >= 0.3 {
            colorCircle = Color.yellow
        } else if currentProgress >= 0.15 {
            colorCircle = Color.orange
        } else {
            colorCircle = Color.red
        }
        
        return colorCircle
    }
    
    var body: some View {
        CircleProgressBarTest(progress: $progress, color: color)
            .frame(width: 200, height: 200)
            .padding(10)
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    self.progress = currentProgress
                }
            }
    }
}


struct CircleProgressBarTest: View {
    
    @Binding var progress: Float
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                .opacity(0.2)
                .rotationEffect(Angle(degrees: 135))
                .foregroundColor(.gray)
                
            Circle()
                .trim(from: 0, to: CGFloat(min(self.progress, 1)))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 135))
        }
    }
}


