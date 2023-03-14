//
//  ContentView.swift
//  Memorize
//
//  Created by Jae Cho on 3/13/23.
//

import SwiftUI

struct ContentView: View {
	@State var emojis = [
		["😀","😇","😎","🥳","🤩","😤","😱","😶‍🌫️","🥵","🥶","😭","🫥","🤢","👹","🤡"],
		["🐶","🐱","🐭","🐰","🦊","🐨","🐻‍❄️","🐵","🐒","🐧","🐔","🦁","🐦","🦄","🦉"],
		["🍏","🍎","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥦","🥑"]
	]
	
	
	@State var emojiCount = 0
	@State var theme = ""

	var body: some View {
		 
		 VStack {
			 Text("Memorize!")
				 .font(.largeTitle)
				 .fontWeight(.heavy)
			 

			 ScrollView{
				 LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
					 
					 if theme == "faces"{
						 ForEach(emojis[0].shuffled()[0..<emojiCount], id: \.self){ emoji in
							 CardView(content: emoji)
								 .aspectRatio(2/3, contentMode: .fit)
						 }
					 }else if theme == "animals"{
						 ForEach(emojis[1].shuffled()[0..<emojiCount], id: \.self){ emoji in
							 CardView(content: emoji)
								 .aspectRatio(2/3, contentMode: .fit)
						 }
					 }else {
						 ForEach(emojis[2].shuffled()[0..<emojiCount], id: \.self){ emoji in
							 CardView(content: emoji)
								 .aspectRatio(2/3, contentMode: .fit)
						 }
					 }

				 }
			 }

			 .foregroundColor(.red)
			 HStack{
				 themeFaces
				 Spacer()
				 themeAnimals
				 Spacer()
				 themeFruit
			 }
			 .font(.largeTitle)
			 .padding(.horizontal)
		 }
		 .padding(.horizontal)
		 
    }
	
	var themeFaces: some View{
		Button {
			theme = "faces"
			emojiCount = Int.random(in: 8..<emojis[0].count)
		} label: {
			VStack{
				Image(systemName: "face.smiling")
				Text("Faces")
					.font(.body)
					.foregroundColor(.white)

			}
		}
	}
	
	var themeAnimals: some View{
		Button {
			theme = "animals"
			emojiCount = Int.random(in: 8..<emojis[1].count)
		} label: {
			VStack{
				Image(systemName: "pawprint.fill")
				Text("Animals")
					.font(.body)
					.foregroundColor(.white)
			}

		}
	}

	var themeFruit: some View{
		Button {
			theme = "fruit"
			emojiCount = Int.random(in: 8..<emojis[2].count)
		} label: {
			VStack{
				Image(systemName: "carrot.fill")
				Text("Fruit")
					.font(.body)
					.foregroundColor(.white)
			}
		}
	}
	

}




struct CardView: View{
	var content: String
	@State var isFaceUp: Bool = true
	var body: some View{
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			if isFaceUp{
				shape.fill().foregroundColor(.white)
				shape.strokeBorder(lineWidth: 3)
				Text(content)
					.font(.largeTitle)
			}else{
				RoundedRectangle(cornerRadius: 20)
				shape.fill()
			}
		}
		.onTapGesture(perform: {
			isFaceUp = !isFaceUp
		})
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		 ContentView()
			 .preferredColorScheme(.dark)
		 ContentView()
			 .preferredColorScheme(.light)
    }
}
