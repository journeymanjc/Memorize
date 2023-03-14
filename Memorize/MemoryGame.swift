//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jae Cho on 3/14/23.
//

import Foundation

struct MemoryGame<CardContent>{
	private(set) var cards: Array<Card>
	
	func choose(_ card: Card){
		
	}
	
	init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
		cards = Array<Card>()
		//Add numberOfPairsOfCards x 2 to cards array
		
		for pairIndex in 0..<numberOfPairsOfCards{
			let content = createCardContent(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
	}
	
	struct Card{
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
