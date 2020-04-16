//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit

struct QuizQuestion: Codable {
    var correctAnswer:Bool?

    let question:String
    let answer:String
}
