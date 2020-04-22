//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct TeamListView: View {
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

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
    }
}
