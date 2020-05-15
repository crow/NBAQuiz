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

struct TeamListView: View {
    @State private var showingAlert = false
    @State private var showingQuiz = false

    var teams:[TeamRow] = [
        TeamRow(title:"Atlanta Hawks", color:Color.red),
        TeamRow(title:"Boston Celtics", color:Color.green),
        TeamRow(title:"Brooklyn Nets", color:Color.black),
        TeamRow(title:"Charlotte Hornets", color:Color.blue),
        TeamRow(title:"Chicago Bulls", color:Color.red),
        TeamRow(title:"Cleveland Caveliers", color:Color.red),
        TeamRow(title:"Dallas Mavericks", color:Color.blue),
        TeamRow(title:"Denver Nuggets", color:Color.yellow),
        TeamRow(title:"Detroit Pistons", color:Color.red),
        TeamRow(title:"Golden State Warriors", color:Color.blue),
        TeamRow(title:"Houston Rockets", color:Color.red),
        TeamRow(title:"Indiana Pacers", color:Color.yellow),
        TeamRow(title:"Los Angeles Clippers", color:Color.red),
        TeamRow(title:"Los Angeles Lakers", color:Color.purple),
        TeamRow(title:"Memphis Grizzlies", color:Color.blue),
        TeamRow(title:"Miami Heat", color:Color.red),
        TeamRow(title:"Milwuake Bucks", color:Color.green),
        TeamRow(title:"Minnesota Timberwolves", color:Color.blue),
        TeamRow(title:"NOLA Pelicans", color:Color.blue),
        TeamRow(title:"New York Knicks", color:Color.orange),
        TeamRow(title:"Oklahoma City Thunder", color:Color.orange),
        TeamRow(title:"Orlando Magic", color:Color.blue),
        TeamRow(title:"Philidelphia 76ers", color:Color.red),
        TeamRow(title:"Phoenix Suns", color:Color.orange),
        TeamRow(title:"Portland TrailBlazers", color:Color.black),
        TeamRow(title:"Sacramento Kings", color:Color.purple),
        TeamRow(title:"San Antonio Spurs", color:Color.black),
        TeamRow(title:"Toronto Raptors", color:Color.red),
        TeamRow(title:"Utah Jazz", color:Color.blue),
        TeamRow(title:"Washington Wizards", color:Color.red)
    ]

       var body: some View {
            ZStack {
                NavigationLink(destination: Text("Make me into a quiz view that displays sheet alerts for each question"), isActive: self.$showingQuiz) { EmptyView() }
                List{
                    ForEach(teams, id: \.self) {team in
                        ZStack {
                            Button(action: {
                                self.showingAlert = true
                            }) {
                                Text("")
                            }
                            .alert(isPresented: self.$showingAlert) {
                                Alert(title: Text("Are you sure you want to choose \(team.name)?"), message: Text("Time to start \(team.name) quiz"), primaryButton: .default(Text("Start \(team.name) quiz"), action: {

                                    self.showingQuiz.toggle()
                                }), secondaryButton: .default(Text("Cancel"), action: {
                                    self.showingQuiz.toggle()
                                }))
                                //                        return Alert(title: Text("Are you sure you want to choose \(decade.name)?"), message: Text("Time to start \(decade.name) quiz"), dismissButton: .default(Text("Choose another decade and try again")))
                            }
                            TeamRow(title: team.title, color: team.color)
                        }
                    }
                }

            }
        }
    }

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


struct Team: Hashable {
    let name:String
    let color:Color
}
