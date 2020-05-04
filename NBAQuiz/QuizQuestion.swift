//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit

struct QuizQuestion: Codable {
    var correctAnswer:Bool?
    let ID = UUID()
    let question:String
    let answer:String
}


//// Section 2
//if let ques = UserDefaults.standard.data(forKey: "6") {
//        decoder.decode([QuizQuestion]).self, let from: Questions = decoded
 //   return
//}
//
//// Section 3
//let defaults = UserDefaults.standard
//defaults.set(true, forKey: "6")
//
//self.Questions = []
