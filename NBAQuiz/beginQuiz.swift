//
//  beginQuiz.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 5/6/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//


import SwiftUI

struct beginQuiz: View {
    var body: some View {
        VStack {
            Text("NBA Quiz")
                .font(.largeTitle)
           // How do I make the action go to HomePage.swift?
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Start")
            }
            .padding(.all)
        }
    }
}

struct beginQuiz_Previews: PreviewProvider {
    static var previews: some View {
        beginQuiz()
    }
}
