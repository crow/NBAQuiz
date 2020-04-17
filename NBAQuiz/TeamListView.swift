//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct TeamRow : View {
    var title:String
    let color:Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("")
            }
            Text(title).foregroundColor(color)
        })
    }
}


// adding a comment
struct TeamListView: View {
    @State private var showingAlert = false
    var teams:[Team] = [
        Team(name:"Atlanta Hawks", color:Color.red),
        Team(name:"Boston Celtics", color:Color.green),
        Team(name:"Brooklyn Nets", color:Color.black),
        Team(name:"Charlotte Hornets", color:Color.blue),
        Team(name:"Chicago Bulls", color:Color.red),
        Team(name:"Cleveland Caveliers", color:Color.red),
        Team(name:"Dallas Mavericks", color:Color.blue),
        Team(name:"Denver Nuggets", color:Color.yellow),
        Team(name:"Detroit Pistons", color:Color.red),
        Team(name:"Golden State Warriors", color:Color.blue),
        Team(name:"Houston Rockets", color:Color.red),
        Team(name:"Indiana Pacers", color:Color.yellow),
        Team(name:"Los Angeles Clippers", color:Color.red),
        Team(name:"Los Angeles Lakers", color:Color.purple),
        Team(name:"Memphis Grizzlies", color:Color.blue),
        Team(name:"Miami Heat", color:Color.red),
        Team(name:"Milwuake Bucks", color:Color.green),
        Team(name:"Minnesota Timberwolves", color:Color.blue),
        Team(name:"NOLA Pelicans", color:Color.blue),
        Team(name:"New York Knicks", color:Color.orange),
        Team(name:"Oklahoma City Thunder", color:Color.orange),
        Team(name:"Orlando Magic", color:Color.blue),
        Team(name:"Philidelphia 76ers", color:Color.red),
        Team(name:"Phoenix Suns", color:Color.orange),
        Team(name:"Portland TrailBlazers", color:Color.black),
        Team(name:"Sacramento Kings", color:Color.purple),
        Team(name:"San Antonio Spurs", color:Color.black),
        Team(name:"Toronto Raptors", color:Color.red),
        Team(name:"Utah Jazz", color:Color.blue),
        Team(name:"Washington Wizards", color:Color.red)
    ]
    var body: some View {
        List{
            ForEach(teams, id: \.name) {team in
                TeamRow(title: team.name, color: team.color)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Are you sure you want to pick this quiz?")
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
