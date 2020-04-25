//
//  test.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/6/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var decades = ["1960", "1970", "1980", "1990", "2000", "2010", "2020"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    @State var Score = false
    @State var Title = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Question")
                        .foregroundColor(.white)

                    Text(decades[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.tapped(number)
                    }) {
                        Image(self.decades[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }

            }
        }
        .alert(isPresented: $Score) {
            Alert(title: Text(Title), message: Text("Your score is "), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func tapped(_ number: Int) {
        if number == correctAnswer {
            Title = "Correct"
        } else {
            Title = "Wrong"
        }

        Score = true
    }

    func askQuestion() {
        decades.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
