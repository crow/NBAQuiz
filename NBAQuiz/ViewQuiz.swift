//  Copyright © 2020 Kayvon. All rights reserved.

import SwiftUI

struct ViewQuiz: View {
    @ObservedObject private var quizManager = QuizManager()
    
    @State private var showResult = false
    
    var body: some View {
        ZStack {
            Color(red: 5.0 / 200.0, green: 35.0 / 200.0, blue: 50.0 / 200.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // This is where the text of the question should appear
                Text(quizManager.quizQuestion.content)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                // Putting a space so that the question text would appear on top of the screen and the possible answers would appear on the bottom
                
                VStack {
                    // This is where the array of decoy answers go
                    ForEach(quizManager.quizQuestion.decoyAnswers) { answer in
                        
                        // Not sure how to make this part locate a1, a2, a3, etc. from QuizAnswers.plist
                        QuizAnswers(answer: QuizQuestionAnswerIdentifierKey) {
                            self.hasBeenCorrectlyAnswered = self.QuizManager.checkAnswer(answer, to: self.QuizManager.quizQuestion.content)
                            self.updateResult()
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
        }
            // This should update a score and then show a popover of your result after the correct answer is answered
        .popover(isPresented: self.$showResult) {
            Result(isPresented: self.$showResult, score: self.quizManager.answerIdentifier)
                .onDisappear {
                    ()
            }
        }

    }
    

    // This should be how you go to the next round
    private func nextQuestion(seconds: Double) {
        // Is this part correct?
        // DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.$quizManager.QuizQuestionContentKey.random()
        }
    }
}

struct ViewQuiz_Previews: PreviewProvider {
    static var previews: some View {
        ViewQuiz()
    }
}
