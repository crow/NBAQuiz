//
//  PlayAgain.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/29/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct PlayAgain: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(red: 0, green: 147.0 / 255.0, blue:  0))
            .foregroundColor(.white)
            .cornerRadius(5.0)
    }
}

struct PlayAgain: View {
    var isResultPresented: Bool
    
    var body: some View {
        Button("Play again") {
        self.isResultPresented = false
        }
        .modifier(PlayAgainModifier())
    }
}
