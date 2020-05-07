//  Copyright © 2020 Kayvon. All rights reserved.

import UIKit
import SwiftUI

struct WelcomeView: View {
    let percentWidthOfParent:CGFloat = 0.95

    let title = "Welcome to NBAQuiz"
    let description =
"""
NBA quiz lets you test your NBA knowledge. Blah blah blah. blah blah blah. Blah blah blah. blah blah blah. Fill up some space with words to make this seem welcoming.

This can also include some really basic instructions or what to expect.
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

