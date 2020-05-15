//
//  uiViewTest.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 5/15/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct uiViewTest: View {
    var body: some View {
           ZStack {
               Color(.orange).opacity(0.2).edgesIgnoringSafeArea(.all)

               VStack(spacing: 10) {
                   Text("Quiz Question")
                       .fontWeight(.light)
                       .multilineTextAlignment(.center)
                       .font(.body)
                       .padding()
                   Spacer()
    
                   Button(action: {}) {
                       Text("Answer 1")
                           .font(.title)
                   }
                   Button(action: {}) {
                       Text("Answer 2")
                           .font(.title)
                   }
                   Button(action: {}) {
                       Text("Answer 3")
                           .font(.title)
                   }
                   Button(action: {}) {
                       Text("Answer 4")
                           .font(.title)
                   }
                   Spacer()
               }
               .foregroundColor(Color.black.opacity(0.7))
               .padding()
           }
       }
struct uiViewTest_Previews: PreviewProvider {
    static var previews: some View {
        uiViewTest()
    }
}
