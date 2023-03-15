//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jae Cho on 3/13/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
	let game = EmojiMemoryGame()
	
	var body: some Scene {
		WindowGroup {
			ContentView(viewModel: game)
		}
	}
}
