//
//  Question.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import Foundation

enum Answer: String, Codable, CaseIterable {
	case A = "A"
	case B = "B"
	case C = "C"
	case D = "D"
}

struct Question: Codable {
	enum CodingKeys: String, CodingKey {
		case question
		case answerA = "A"
		case answerB = "B"
		case answerC = "C"
		case answerD = "D"
		case correctAnswer = "answer"
	}
	
	var question: String
	var answerA: String
	var answerB: String
	var answerC: String
	var answerD: String
	var correctAnswer: Answer
	
	var answers: [Answer: String] {
		[.A: answerA,
		 .B: answerB,
		 .C: answerC,
		 .D: answerD]
	}
}

extension Question: Equatable {}

extension Question {
	static func testQuestion() -> Question {
		Question(question: "Test Question",
				 answerA: "Test Answer 1",
				 answerB: "Test Answer 2",
				 answerC: "Test Answer 3",
				 answerD: "Test Answer 4",
				 correctAnswer: .A)
	}
}
