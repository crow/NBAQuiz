//
//  home_page.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 4/5/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//


// Is any of this correct? The idea should be it should have a title on the front page, and then two buttons on the buttom of the page for "Teams" and "Decades"

import SwiftUI

struct HomePage: View {
    var body: some View {
        HStack {
            // Added a NavigationView to link the button to a new file
            NavigationView {
            HStack {
                NavigationLink(destination: TeamListView()) {
                Text("Teams")
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .padding(.all)
                    .frame(maxHeight: .infinity)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Decades")
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .padding(.all)
                    .frame(maxHeight: .infinity)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*/Color.green/*@END_MENU_TOKEN@*/)
            }
        }
        
        NavigationView {
        Text("Settings")
        .navigationBarTitle("Settings")
        .navigationBarItems(trailing:
            Button(action: {
                print("Settings button was tapped")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "arrow.2.circlepath")
                    Text("Settings")
                    )
    }
}

struct HomePage_Previews: PreviewProvider {)
    static var previews: some View {
        HomePage()
    }
}
}


}
}
}
