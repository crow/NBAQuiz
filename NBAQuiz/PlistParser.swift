<<<<<<< HEAD
//
//  PlistParser.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/16/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//
=======
//  Copyright © 2020 Kayvon. All rights reserved.
>>>>>>> 8de06628f396ad41c567bb920fc94607879067e1

import UIKit

class PlistParser: NSObject {

    // Create Singleton to access this class wherever you need to
    // https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift
    static let shared = PlistParser()

    // Keep a constant of the plist name as it appears in files
    private let plistName = "Quizzes"

    let plistURL: URL

    override init() {
        plistURL = URL(fileURLWithPath: Bundle.main.path(forResource: plistName, ofType: "plist")!)
        super.init()
    }

    // This will return a nested QuizData object that you can inspect
    func parseQuizData() -> QuizData? {
        do {
            let data = try Data(contentsOf: plistURL)
            let decoder = PropertyListDecoder()
            return try decoder.decode(QuizData.self, from: data)
        } catch {
            // Handle error
            // Print something you'll see in console to indicate this failed
            // you can use emojis
            print(error)
        }

        return nil
    }
}
<<<<<<< HEAD

=======
>>>>>>> 8de06628f396ad41c567bb920fc94607879067e1
