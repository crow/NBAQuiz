//
//  SplashScreen.swift
//  NBAQuiz
//
//  Created by Kayvon Moradi on 5/22/20.
//  Copyright © 2020 Kayvon. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
  static var shouldAnimate = true
  let circleColor = Color("black")
  let uLineWidth: CGFloat = 3
  let uZoomFactor: CGFloat = 1.0
  let lineWidth:  CGFloat = 2
  let lineHeight: CGFloat = 25
  let uSquareLength: CGFloat = 10
  
  @State var percent = 0.0
  @State var uScale: CGFloat = 1
  @State var squareColor = Color.white
  @State var squareScale: CGFloat = 1
  @State var lineScale: CGFloat = 1
  @State var textAlpha = 0.0
  @State var textScale: CGFloat = 1
  @State var coverCircleScale: CGFloat = 1
  @State var coverCircleAlpha = 0.0
  
  var body: some View {
    ZStack {
      Image("ball_logo")
        .resizable(resizingMode: .tile)
        .opacity(textAlpha)
        .scaleEffect(textScale)
      
      Circle()
        .fill(circleColor)
        .frame(width: 1, height: 1,
               alignment: .center)
        .scaleEffect(coverCircleScale)
        .opacity(coverCircleAlpha)
      
      Text("NBA            UIZ")
        .font(.largeTitle)
        .foregroundColor(.black)
        .opacity(textAlpha)
        .offset(x: 1, y: 0)
        .scaleEffect(textScale)
      
      FuberU(percent: percent)
        .stroke(Color.white, lineWidth: uLineWidth)
        .rotationEffect(.degrees(-90))
        .aspectRatio(1, contentMode: .fit)
        .padding(20)
        .onAppear() {
          self.handleAnimations()
      }
      .scaleEffect(uScale * uZoomFactor)
      .frame(width: 45, height: 45,
             alignment: .center)
      
      Rectangle()
        .fill(squareColor)
        .scaleEffect(squareScale * uZoomFactor)
        .frame(width: uSquareLength, height: uSquareLength,
               alignment: .center)
        .onAppear() {
          self.squareColor = self.circleColor
      }
      
      Rectangle()
        .fill(circleColor)
        .scaleEffect(lineScale, anchor: .bottom)
        .frame(width: lineWidth, height: lineHeight,
               alignment: .center)
        .offset(x: 0, y: -20)
      
      Spacer()
    }
    .background(circleColor)
    .edgesIgnoringSafeArea(.all)
  }
}

extension SplashScreen {
var uAnimationDuration: Double { return 1.0 }
var uAnimationDelay: Double { return  0.2 }
var uExitAnimationDuration: Double { return 0.3 }
var finalAnimationDuration: Double { return 0.4 }
var minAnimationInterval: Double { return 0.1 }
var fadeAnimationDuration: Double { return 0.4 }
  
  func handleAnimations() {
    runAnimation()
    if SplashScreen.shouldAnimate {
      restartAnimation()
    }
  }
  
  func runAnimation() {
    withAnimation(.easeIn(duration: uAnimationDuration)) {
      percent = 1
      uScale = 5
      lineScale = 1
    }
    
    withAnimation(Animation.easeIn(duration: uAnimationDuration).delay(0.5)) {
      textAlpha = 1.0
    }
    

  
  
  
  func restartAnimation() {
    let deadline: DispatchTime = .now() + 2*uAnimationDuration + finalAnimationDuration
    DispatchQueue.main.asyncAfter(deadline: deadline) {
      self.percent = 0
      self.textScale = 1
      self.coverCircleAlpha = 0
      self.coverCircleScale = 1
      self.handleAnimations()
    }
  }
}

struct FuberU: Shape {
  var percent: Double
  
  func path(in rect: CGRect) -> Path {
    let end = percent * 360
    var p = Path()
    
    p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
             radius: rect.size.width/2,
             startAngle: Angle(degrees: 0),
             endAngle: Angle(degrees: end),
             clockwise: false)
    
    return p
  }
  
  var animatableData: Double {
    get { return percent }
    set { percent = newValue }
  }
}


struct SplashScreen_Previews : PreviewProvider {
  static var previews: some View {
    SplashScreen()
  }
}





// import SwiftUI

//struct TitleView: View {
//    var body: some View {
   //     VStack {
    //        Image("gradientsIcon")
    //            .resizable()
    //            .aspectRatio(contentMode: .fit)
    //            .frame(width: 180, alignment: .center)
     //           .accessibility(hidden: true)

     //       Text("Welcome to")
     //           .customTitleText()

      //      Text("NBA Quiz")
      //          .customTitleText()
      //          .foregroundColor(.mainColor)
      //  }
 //   }
// }

}
