//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct HomePage: View {
    let percentParentHeight:CGFloat = 0.90
    let percentParentWidth:CGFloat = 0.40

    var body: some View {
        HStack {
            // Added a NavigationView to link the button to a new file
            HStack {
                GeometryReader { geo in
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack {
                            Spacer()
                            NavigationLink(destination: TeamListView()) {
                                Text("Teams")
                                    .font(.largeTitle)
                                    .frame(width: geo.size.width * self.percentParentWidth, height: geo.size.height * self.percentParentHeight)
                                    .foregroundColor(Color.white)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: geo.size.height * self.percentParentWidth)
                                    .background(Color.blue)
                                    .border(Color.black)

                            }
                            NavigationLink(destination: DecadesListView()) {
                                Text("Decades").font(.largeTitle).frame(width: geo.size.width * self.percentParentWidth, height: geo.size.height * self.percentParentHeight)
                                    .foregroundColor(Color.white)
                                    .border(Color.black)
                                    .background(Color.green)
                            }
                            Spacer()
                        }
                    })
                    Spacer()
                }
            }
        }

        //        Text("Settings")
        //        .navigationBarTitle("Settings")
        //
        //            }        .navigationBarItems(trailing:
        //            Button(action: {
        //                print("Settings button was tapped")
        //            }) {
        //                HStack(spacing: 10) {
        //                    Image(systemName: "arrow.2.circlepath")
        //                    Text("Settings")
        //                }
        //            })
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

