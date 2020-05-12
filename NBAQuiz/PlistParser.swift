//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit

class PlistParser: NSObject {

    // Create Singleton to access this class wherever you need to
    // https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift
    static let shared = PlistParser()

    // Keep a constant of the plist name as it appears in files
    private let questionsPlist = "QuizQuestions"
    private let answersPlist = "QuizAnswers"

    let plistURL: URL

    override init() {
        plistURL = URL(fileURLWithPath: Bundle.main.path(forResource: questionsPlist, ofType: "plist")!)
        super.init()
    }


    // This will return a nested QuizData object that you can inspect
    func parseQuizData() -> [String:QuizQuestion]? {
        var plistData: [String:AnyObject] = [:]

        do {
            let plistXML = try Data(contentsOf: plistURL)
            var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
            do {
                plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:AnyObject]
            } catch {
                print("Error reading plist: \(error), format: \(propertyListFormat)")
            }
        } catch {
            print("error no upload")
        }

        for (key, value) in plistData {
            
        }

        return nil
    }
}
