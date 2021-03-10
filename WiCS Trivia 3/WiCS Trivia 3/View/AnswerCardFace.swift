//
//  AnswerCardFace.swift
//  WiCS Trivia 3
//
//  Created by Josh Jaslow on 3/9/21.
//

import SwiftUI

struct AnswerCardFace: View {
	@Binding var flipped: Bool
	var text: String
	var color: Color
	var angle: Angle
	var opacity: Double
	
    var body: some View {
		HStack {
			Spacer()
			
			Text(text.capitalizingFirstLetter())
				.font(.system(size: 28))
			
			Spacer()
		}
		.frame(height: 100)
		.background(
			RoundedRectangle(cornerRadius: 15)
				.fill(color)
		)
		.rotation3DEffect(angle,
						  axis: (x: 1.0, y: 0.0, z: 0.0))
		.opacity(opacity)
    }
}

extension String {
	func capitalizingFirstLetter() -> String {
		return prefix(1).capitalized + dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
}

struct AnswerCardFace_Previews: PreviewProvider {
    static var previews: some View {
		AnswerCardFace(flipped: .constant(false),
					   text: "Answer",
					   color: .blue,
					   angle: .zero,
					   opacity: 1)
    }
}
