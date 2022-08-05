//
//  ContentView.swift
//  SwiftUICircleProgressBar
//
//  Created by James Thang on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var correctNumber = 5
    @State var totalNumber = 10
    
    var body: some View {
        CircleProgressBar(currentProgress: (Float(correctNumber)/Float(totalNumber)) * 0.75)
            .offset(y: 30)
            .clipped()
    }
}

