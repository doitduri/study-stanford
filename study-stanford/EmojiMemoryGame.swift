//
//  EmojiMemoryGame.swift
//  study-stanford
//
//  Created by 김두리 on 2021/08/23.
//

import SwiftUI

// ViewModel
class EmojiMemoryGame {
    // Model과 Viewdml wndrowk
    // 디스크나 네트워크 또는 그 밖의 무언가에 해당하는 항목을 유지하도록 하는 것이 뷰모델
    
    
    // Cannot use instance member 'createMemoryGam' within property initializer; property initializers run before 'self' is available 오류 해결하기 위해
    // static으로 class 내 상수화를 해줘서 이니셜라이징을 미리 해줌
    
    // type variable, type function이라고 함
    static let emojis = ["🚗",  "🚘", "🚎", "🛴", "🚙", "🛻", "🚚", "🚛", "🚜", "🏎", "🏍", "🛵", "🦽", "🦼", "🛺", "🚲", "🛹", ]
    
    static func createMemoryGam() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCard: { paireIndex in  EmojiMemoryGame.emojis[paireIndex] })
    }
    
    private var model: MemoryGame<String> = createMemoryGam()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
