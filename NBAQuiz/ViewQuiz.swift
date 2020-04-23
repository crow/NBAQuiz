//
//  ViewQuiz.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/22/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

class ViewQuiz: ObservableObject {

// Making a variable to track whether or not thw question has come up
private var questionsUsed = [QuizQuestion]()

var questionsAsked = 0
var correctAnswers = 0

// Checking if the question has been asked before
func getQuestion() {
    var random = (QuizQuestion.shuffled() as AnyObject).first; else do { return }
    
    if questionsUsed.isEmpty || !questionsUsed.contains(random) {
        questionsUsed.append(random)
        currentQuestion = random
    } else {
        for QuizQuestion in questionsUsed {
            while random == QuizQuestion {
                random = QuizQuestion.shuffled().first!
                questionsUsed.append(random)
                currentQuestion = random
            }
        }
    }
}
}
