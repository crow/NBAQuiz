//
//  pair_plist.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/7/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import UIKit

struct MySettings: Codable {
    var question1: String
    var question2: String
    var question3: String
}


// Trying something different

let someSettings = MySettings(question1: "Answer", question2: "Answer", question3: "Answer")
let encoder = PropertyListEncoder()
encoder.outputFormat = .xml
do {
    let data = try enconder.encode(someSettings)
    try data.write(to: settingsURL)
} catch {
    print(error)
}
