//
//  quiz.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/5/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import UIKit

//struct Question {
//    let text: String
//    let options: [String]
//    let correctAnswer: Int
//    var incorrectAnswer: Int
//}

//class questions {
//    var array = [Question]()
//    var questionNumber = 1
//    
//    // This is where the questions are stored for "Decades"
//    
//    let que1 = Question(text: "Which current coach did Allen Iverson disrespectfully step over in the 2001 NBA Finals?", options: ["Jason Kidd", "Brian Shaw", "Tyronne Lue", "Steve Kerr"], correctAnswer: 2, incorrectAnswer: -1)
//    let que2 = Question(text: "Which player scored 71 points on the final night of the regular season to pass Shaq for scoring title?", options: ["David Robinson", "Allen Iverson", "Tim Duncan", "Kobe Bryant"], correctAnswer: 0, incorrectAnswer: -1)
//    let que3 = Question(text: "Which bust was selected above Kevin Durant in the NBA Draft?", options: ["Andrew Wiggins", "Greg Oden", "Adam Morrison", "Anthony Bennet"], correctAnswer: 1, incorrectAnswer: -1)
//
//    var array = [que1, que2, que3]
//}




// Or this:

var qs = ["Which current coach did Allen Iverson disrespectfully step over in the 2001 NBA Finals?",
                 "Which player scored 71 points on the final night of the regular season to pass Shaq for scoring title?",
                 "Which bust was selected above Kevin Durant in the NBA Draft?"]
//All Anssers in allAnswers array
var allAnswers = [["Jason Kidd", "Brian Shaw", "Tyronne Lue", "Steve Kerr"],
                  ["David Robinson", "Allen Iverson", "Tim Duncan", "Kobe Bryant"],
                  ["Andrew Wiggins", "Greg Oden", "Adam Morrison", "Anthony Bennet"]]
//corrent answer index for each question
var correctAnswer = [2,0,1]



// Or this:

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}
var questions: [Question] = [
    Question(
        question: "Which current coach did Allen Iverson disrespectfully step over in the 2001 NBA Finals?",
        answers: ["Jason Kidd", "Brian Shaw", "Tyronne Lue", "Steve Kerr"],
        correctAnswer: 2),
    Question(
        question: "Which player scored 71 points on the final night of the regular season to pass Shaq for scoring title?",
        answers: ["David Robinson", "Allen Iverson", "Tim Duncan", "Kobe Bryant"],
        correctAnswer: 0),
    Question(
        question: "Which bust was selected above Kevin Durant in the NBA Draft?",
        answers: ["Andrew Wiggins", "Greg Oden", "Adam Morrison", "Anthony Bennet"],
        correctAnswer: 1)
]
