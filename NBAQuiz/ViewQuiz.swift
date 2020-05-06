//
//  ViewQuiz.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/22/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

class ViewQuiz: ObservableObject {
    // Making a variable to track whether or not the question has come up
    private var questionsUsed = [QuizQuestion]()
    
    // Is this how to set the variable for currentQuestion?
    @Published var currentQuestion = QuizQuestion(question: "", answer: answer(text: ""))

    var questionsAsked = 0
    var correctAnswers = 0
    
    
    
//UI part
    
    // private func reset() {
            // QuizQuestion.questionsAsked = 0
            // QuizQuestion.correctAnswers = 0
            //QuizQuestion.getRandomQuestion()
        // }
        
        // private func update() {
            // if QuizQuestion.questionsAsked == 10 {
               //  self.Result.toggle()
            // } else {
               //  loadNextRoundWithDelay(seconds: 1)
        //    }
      //  }
        
      //  private func loadNextRoundWithDelay(seconds: Double) {
         //       self.textColor = .white
         //       self.QuizQuestion.getRandomQuestion()
         //   }
      //  }
    
    

    // Checking if the question has been asked before
    func getQuestion() {
        guard var random = questionsUsed.shuffled().first else { return }

            if questionsUsed.isEmpty || !questionsUsed.contains(random) {
                questionsUsed.append(random)
                currentQuestion = [random]
            } else {
                for QuizQuestion in questionsUsed {
                    while random == QuizQuestion {
                        random = (QuizQuestion.shuffled() as AnyObject).first!
                        questionsUsed.append(random)
                        currentQuestion = [random]
                    }
                }
            }
    }

    // Is this how you check the answer?
    func userAnswer (_ answer: answer, to question: question) -> Bool {
        questionsAsked += 1
        
        if answer.text == answer.question.text {
            correctAnswers += 1
        }
        return answer.text == question.answer.text
    }

