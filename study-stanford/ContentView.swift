//
//  ContentView.swift
//  study-stanford
//
//  Created by 김두리 on 2021/08/20.
//

import SwiftUI


// View
// Model에 의존해서 View를 보여줄 수 있어야 함
struct ContentView: View {
    // @ObservedObject가 변경 되었을 때 UI re-build
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State var emojiCount = 10
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // intent
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.orange)
            Spacer()
//            HStack{
//                add
//                Spacer()
//                remove
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
//    var remove: some View {
//        Button(action: {
//           if emojiCount > 1 { emojiCount -= 1}
//        }, label: {
//            Image(systemName: "minus.circle")
//        })
//    }
//
//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis.count {emojiCount += 1}
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
}

struct CardView: View {
    // 되도록 var로 선언되는 경우는 @State, 그 외 let
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                // strokeBorder outside border 설정
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
//        .onTapGesture {
//            card.isFaceUp = !card.isFaceUp
//        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
