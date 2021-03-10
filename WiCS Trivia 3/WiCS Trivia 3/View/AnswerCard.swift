//
//  AnswerCard.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

struct AnswerCard: View {
	@EnvironmentObject var viewModel: QuestionViewModel
	@State var answer: Answer
	@State private var flipped: Bool = false
	
	var flippedAngle: Angle {
		return Angle(degrees: flipped ? 180 : 0)
	}
	
	var oppositeFlippedAngle: Angle {
		return Angle(degrees: flipped ? 0 : -180)
	}
	
    var body: some View {
		ZStack {
			AnswerCardFace(flipped: $flipped,
						   text: viewModel.currentQuestion.answers[answer] ?? "Answer not found",
						   color: Color.blue.opacity(0.6),
						   angle: flippedAngle,
						   opacity: flipped ? 0 : 1)
			
			AnswerCardFace(flipped: $flipped,
						   text: revealedAnswerText(),
						   color: revealedAnswerColor(),
						   angle: oppositeFlippedAngle,
						   opacity: flipped ? 1 : 0)
		}
		.padding(.horizontal, 15)
		.onTapGesture {
			withAnimation(.easeInOut) {
				flipped.toggle()
				if answer == viewModel.currentQuestion.correctAnswer {
					viewModel.correctAnswerFound = true
				}
			}
		}
		.onChange(of: viewModel.currentQuestion) { _ in
//			withAnimation(.easeInOut) {
				flipped = false
//			}
		}
    }
	
	func revealedAnswerText() -> String {
		if answer == viewModel.currentQuestion.correctAnswer {
			return "Correct!"
		} else {
			return "Incorrect!😿"
		}
	}
	
	func revealedAnswerColor() -> Color {
		if answer == viewModel.currentQuestion.correctAnswer {
			return Color.green.opacity(0.6)
		} else {
			return Color.red.opacity(0.6)
		}
	}
}

struct AnswerCard_Previews: PreviewProvider {
    static var previews: some View {
		AnswerCard(answer: .A)
			.environmentObject(QuestionViewModel())
    }
}
