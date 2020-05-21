//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit
import SwiftUI

struct WelcomeView: View {
    let percentWidthOfParent:CGFloat = 0.95

    let title = "Welcome to NBAQuiz"
    let description =
        
        // Still going to fix the finalized version of this text, but here's a start.
"""
NBA quiz is where you can test your knowlegde about all things NBA. Whether you grew up a Lakers fan, a Michael Jordan fan, or even a LeBron fan, this is where you can tesr your knoweldge to the limits.

In thw next screen, you're going to choose which kind of quiz you want to play. You will have the option to choose between questions separated by NBA decades or questions separated by NBA teams. Let the fun begin!
"""
    

    let buttonTitle = "Start a quiz"


    var body: some View {

        HStack {
            NavigationView {
                GeometryReader { geo in
                    VStack (spacing: 24, content: {
                        Text(self.title).font(.largeTitle).frame(width: geo.size.width * self.percentWidthOfParent).padding(.bottom, 24)

                        Text(self.description).frame(width: geo.size.width * self.percentWidthOfParent).font(.subheadline)

                        NavigationLink(destination: HomePage()) {
                            ZStack {
                                Capsule().foregroundColor(.red).frame(width: geo.size.width * self.percentWidthOfParent, height: 54)
                                Text(self.buttonTitle).font(.title).foregroundColor(.white)
                            }
                        }.buttonStyle(DefaultButtonStyle())

                        Spacer()
                    })
                }
            }
        }
    }

}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

