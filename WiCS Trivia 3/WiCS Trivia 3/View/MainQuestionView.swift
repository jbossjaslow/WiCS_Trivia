//
//  ContentView.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

//Model View ViewModel (MVVM)

struct MainQuestionView: View {
	@EnvironmentObject var viewModel: QuestionViewModel
	
    var body: some View {
		VStack {
			ScrollView {
				HStack {
					Text(viewModel.currentQuestion.question)
						.font(.largeTitle)
						.padding(.horizontal, 15)
					
					Spacer()
				}
			}
			.frame(height: 200)
			
			ForEach(Answer.allCases, id: \.self) { answer in
				AnswerCard(answer: answer)
			}
			
			SkipButton()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		MainQuestionView()
			.environmentObject(QuestionViewModel())
    }
}
