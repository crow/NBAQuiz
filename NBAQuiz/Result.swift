//
//  Result.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/20/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct Result: View {
    @Binding var isPresented: Bool
    
    var score: Int
    
    var body: some View {
        ZStack {
            Color(red: 8.0 / 200.0, green: 40.0 / 200.0, blue: 50.0 / 200.0)
            
            VStack {
                VStack {
                    Text("You have scored:")
                    Text("\(score)/10")
                    Text("correct")
                }
                
                PlayAgain(isResultPresented: isPresented)
            }
            .padding()
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(isPresented: .constant(true), score: 0)
    }
}


