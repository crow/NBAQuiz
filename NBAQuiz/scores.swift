//
//  quiz_second_attempt.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/6/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct Scores: View {
    @State private var Decades = ["1960", "1970", "1980", "1990", "2000", "2010", "2020"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var alert = ""
    @State private var showAlert = false


    var body: some View {
        NavigationView {
            VStack {
                ForEach(0...2) { number in

                }
            }
        }
        .navigationBarTitle(Text(Decades[correctAnswer]))
        .presentation($showAlert) {
            Alert(title: Text(alert), message: Text("Your score is now \(score)"), dismissButton: .default(Text("Continue")) {
                self.question()
                })
        }
    }

    func decadeTap(_ tag: Int) {
        if tag == correctAnswer {
            score += 1
            alert = "Correct"
        } else {
            score -= 1
            alert = "wrong"
        }

        showAlert = true
    }

    func question() {
        Decades.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct Scores: PreviewProvider {
    static var previews: some View {
        Scores()
    }
}

