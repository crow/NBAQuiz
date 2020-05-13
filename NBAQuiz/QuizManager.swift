//  Copyright © 2020 Kayvon. All rights reserved.
import Foundation

struct QuizAnswer {
    let identifier:String
    let content:String
}

struct QuizQuestion {
    static let QuizQuestionContentKey = "content"
    static let QuizQuestionAnswerIdentifierKey = "answerIdentifier"

    /// This key is computed so we can use the identifier in the key itself
    var QuizQuestionAnsweredKey:String {
        return "NBAQuiz-\(self.identifier)-hasBeenCorrectlyAnswered"
    }

    let identifier:String
    let content:String
    let answerIdentifier:String

    var hasBeenCorrectlyAnswered:Bool? {
        set(correctlyAnswered) { UserDefaults.standard.set(correctlyAnswered, forKey: QuizQuestionAnsweredKey) }

        get { UserDefaults.standard.bool(forKey: QuizQuestionAnsweredKey) }
    }

    /// Sets its hasBeenCorrectlyAnswered nil to reset the question
    func forgetEverything(){
        UserDefaults.standard.set(nil, forKey: QuizQuestionAnsweredKey)
    }
}

class QuizManager {
    static let shared = QuizManager()

    let quizQuestions:[QuizQuestion]
    let quizAnswers:[QuizAnswer]

    let plistParser:PlistParser

    init() {
        self.plistParser = PlistParser()

        quizQuestions = plistParser.parseQuizQuestions()
        quizAnswers = plistParser.parseQuizAnswers()
    }
}
