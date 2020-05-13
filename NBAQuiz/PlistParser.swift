//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit

class PlistParser: NSObject {
    // Create Singleton to access this class wherever you need to
    // https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift
    static let shared = PlistParser()

    // Keep a constant of the plist name as it appears in files
    private let questionsPlist = "QuizQuestions"
    private let answersPlist = "QuizAnswers"

    let questionsURL:URL
    let answersURL:URL



    override init() {
        questionsURL = URL(fileURLWithPath: Bundle.main.path(forResource: questionsPlist, ofType: "plist")!)
        answersURL = URL(fileURLWithPath: Bundle.main.path(forResource: answersPlist, ofType: "plist")!)

        super.init()
    }

    func parseQuizAnswers() -> [QuizAnswer] {
        var quizAnswers:[QuizAnswer] = []

        let plistObjs:[String:AnyObject] = parsePlistObjects(url: answersURL)

        for (identifier, content) in plistObjs {
            guard let content = content as? String else {
                print("Incorrect content entry in QuizQuestion plist.")
                continue
            }

            quizAnswers.append(QuizAnswer(identifier: identifier, content: content))
        }

        return quizAnswers
    }

    func parseQuizQuestions() -> [QuizQuestion] {
        var quizQuestions:[QuizQuestion] = []

        let plistObjs:[String:AnyObject] = parsePlistObjects(url: questionsURL)

        for (identifier, questionDict) in plistObjs {
            guard let content = questionDict[QuizQuestion.QuizQuestionContentKey] as? String else {
                print("Incorrect content entry in QuizQuestion plist.")
                continue
            }
            guard let answerIdentifier = questionDict[QuizQuestion.QuizQuestionAnswerIdentifierKey] as? String else {
                print("Incorrect answer identifier entry in QuizQuestion plist.")
                continue
            }

            quizQuestions.append(QuizQuestion(identifier: identifier, content: content, answerIdentifier: answerIdentifier))
        }

        return quizQuestions
    }

    private func parsePlistObjects(url:URL) -> [String:AnyObject] {
        var plistObjs:[String:AnyObject] = [:]

        do {
            let plistXML = try Data(contentsOf: url)
            var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
            do {
                plistObjs = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:AnyObject]
            } catch {
                print("Error reading plist: \(error), format: \(propertyListFormat)")
            }
        } catch {
            print("error no upload")
        }

        return plistObjs
    }
}
