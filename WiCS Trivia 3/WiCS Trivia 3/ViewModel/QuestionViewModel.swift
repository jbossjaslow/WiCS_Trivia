//
//  QuestionViewModel.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

class QuestionViewModel: ObservableObject {
	@Published var currentQuestion: Question = Question.testQuestion()
	@Published var correctAnswerFound: Bool = false
	
	private var questions: [Question] = []
	
	init() {
		do {
			let jsonData = readLocalFile(forName: "questions")!
			questions = try JSONDecoder().decode([Question].self,
												 from: jsonData)
			loadNewQuestion()
		} catch {
			print(error.localizedDescription)
		}
	}
	
	private func readLocalFile(forName name: String) -> Data? {
		do {
			if let bundlePath = Bundle.main.path(forResource: name,
												 ofType: "json"),
			   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
				return jsonData
			}
		} catch {
			print(error.localizedDescription)
		}
		
		return nil
	}
	
	func loadNewQuestion() {
		guard questions.count > 0 else {
			return
		}
		correctAnswerFound = false
		let randomIndex = Int.random(in: 0..<questions.count)
		currentQuestion = questions.remove(at: randomIndex)
	}
}
