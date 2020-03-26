//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct TeamRow : View {
    var title:String
    let color:Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(title).foregroundColor(color)
        })
    }
}


// adding a comment
struct TeamListView: View {
    var teams:[Team] = [
        Team(name:"Blazers", color:Color.red),
        Team(name:"Lakers", color:Color.purple)
    ]
    var body: some View {
        List{
            ForEach(teams, id: \.name) {team in
                TeamRow(title: team.name, color: team.color)
            }
        }
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView()
    }
}

struct Team {
    let name:String
    let color:Color
}
