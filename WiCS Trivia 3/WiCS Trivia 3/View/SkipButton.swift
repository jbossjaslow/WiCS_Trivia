//
//  SkipButton.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

struct SkipButton: View {
	@EnvironmentObject var viewModel: QuestionViewModel
	
    var body: some View {
		Button {
			viewModel.loadNewQuestion()
		} label: {
			HStack {
				Spacer()
				
				Text(viewModel.correctAnswerFound ? "NextQuestion" : "Skip")
					.font(.title2)
					.bold()
					.foregroundColor(.white)
				
				Spacer()
			}
			.frame(height: 60)
			.background(
				RoundedRectangle(cornerRadius: 15)
					.fill(Color.purple.opacity(0.6))
			)
			.padding(.horizontal, 15)
		}
		.buttonStyle(SkipQuestionButtonStyle())
    }
}

struct SkipQuestionButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? 0.9 : 1.0)
			.animation(.spring(response: 0.1,
							   dampingFraction: 0.4,
							   blendDuration: 0.1))
	}
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton()
			.environmentObject(QuestionViewModel())
    }
}
