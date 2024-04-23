//
//  QuestionView.swift
//  handling errors
//
//  Created by Ivan Petrunin on 26.02.2024.
//

import SwiftUI

struct QuestionView: View {
  
    @EnvironmentObject var viewModel: GameViewModel
  let question: Question
  
  var body: some View {
    VStack {
      Text(question.questionText)
        .font(.largeTitle)
        .bold()
        .multilineTextAlignment(.leading)
      Spacer()
        HStack {
          ForEach(0..<question.possibleAnswers.count) { answerIndex in
            Button(action: {
              print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
              viewModel.makeGuess(atIndex: answerIndex)
            }) {
              ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                    .background(viewModel.color(forOptionindex: answerIndex))
            }
            .disabled(viewModel.guessWasMade)
          }
        }
        if viewModel.guessWasMade {
            Button(action: { viewModel.displayNextScreen() }) {
                BottomTextView(str: "Next")
            }
        }
    }
  }
}

struct QuestionView_Pereviews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion)
    }
}
