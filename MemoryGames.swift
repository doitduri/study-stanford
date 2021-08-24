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
    
    mutating func choose(_ card: Card) {
        // card.isFaceUp.toggle() -> 에러, 파라미터로 넘어온 애들은 let, 따라서 변경 불가
        // 그래서, cards에서 변경
        
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosenCard = \(cards[chosenIndex])")
        print(cards)
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCard: (Int) -> CardContent ) {
        cards = Array<Card>()
        // add numberOfPairsOfCards*2
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCard(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Card struct가 MemoryGame와 중첩되지 않아도 되지만,
    // 명확하게 MemoryGame의 Card 임을 명시하기 위해 중첩한다.
    
    // Identifiable 추가를 함으로써 식별할 수 있음 (protocol strub)
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
