//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jae Cho on 3/14/23.
//

import SwiftUI



class EmojiMemoryGame {
	static let emojis = ["😀","😇","😎","🥳","🤩","😤","😱","😶‍🌫️","🥵","🥶","😭","🫥","🤢","👹","🤡"]
	//This is to protect the Model
	
	static func createMemoryGame() -> MemoryGame<String> {
		MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
			EmojiMemoryGame.emojis[pairIndex]
		}
	}
	
	private var model: MemoryGame<String> = createMemoryGame()
	
	//Because we get a copy of the card we use an inline function.
	var cards: Array<MemoryGame<String>.Card> {
		return model.cards
	}
}
