//
//  WiCS_Trivia_3App.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

@main
struct WiCS_Trivia_3App: App {
    var body: some Scene {
        WindowGroup {
            MainQuestionView()
				.environmentObject(QuestionViewModel())
        }
    }
}
