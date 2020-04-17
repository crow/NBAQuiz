//
//  home_page.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/5/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//


// Is any of this correct? The idea should be it should have a title on the front page, and then two buttons on the buttom of the page for "Teams" and "Decades"

import SwiftUI

struct homePage: View {
    var body: some View {
        HStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Teams")
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .padding(.all)
                    .frame(maxHeight: .infinity)
                }
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Decades")
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .padding(.all)
                .frame(maxHeight: .infinity)
            }
        }
    }
}

struct homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
    }
}
