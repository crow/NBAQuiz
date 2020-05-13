//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct DecadeRow : View {
    var title:String
    let color:Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(title).foregroundColor(color)
        })
    }
}

struct DecadesListView: View {
    @State private var showingAlert = false
    @State private var showingQuiz = false

    var decades:[Decade] = [
        Decade(name:"1960", color:Color.blue),
        Decade(name:"1970", color:Color.red),
        Decade(name:"1980", color:Color.green),
        Decade(name:"1990", color:Color.black),
        Decade(name:"2000", color:Color.orange),
        Decade(name:"2010", color:Color.purple),
        Decade(name:"2020", color:Color.red)
    ]
    var body: some View {
        ZStack {
            NavigationLink(destination: Text("Make me into a quiz view that displays sheet alerts for each question"), isActive: self.$showingQuiz) { EmptyView() }
            List{
                ForEach(decades, id: \.self) {decade in
                    ZStack {
                        Button(action: {
                            self.showingAlert = true
                        }) {
                            Text("")
                        }
                        .alert(isPresented: self.$showingAlert) {
                            Alert(title: Text("Are you sure you want to choose \(decade.name)?"), message: Text("Time to start \(decade.name) quiz"), primaryButton: .default(Text("Start \(decade.name) quiz"), action: {

                                self.showingQuiz.toggle()
                            }), secondaryButton: .default(Text("Cancel"), action: {
                                self.showingQuiz.toggle()
                            }))
                            //                        return Alert(title: Text("Are you sure you want to choose \(decade.name)?"), message: Text("Time to start \(decade.name) quiz"), dismissButton: .default(Text("Choose another decade and try again")))
                        }
                        DecadeRow(title: decade.name, color: decade.color)
                    }
                }
            }

        }
    }
}


struct DecadesListView_Previews: PreviewProvider {
    static var previews: some View {
        DecadesListView()
    }
}

struct Decade: Hashable {
    let name:String
    let color:Color
}


