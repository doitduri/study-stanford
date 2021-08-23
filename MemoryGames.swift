//
//  MemoryGames.swift
//  study-stanford
//
//  Created by 김두리 on 2021/08/23.
//

import Foundation

// Model
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCard: (Int) -> CardContent ) {
        cards = Array<Card>()
        // add numberOfPairsOfCards*2
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCard(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // Card struct가 MemoryGame와 중첩되지 않아도 되지만,
    // 명확하게 MemoryGame의 Card 임을 명시하기 위해 중첩한다.
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
    }
}
