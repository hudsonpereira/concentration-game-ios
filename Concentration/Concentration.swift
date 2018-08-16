//
//  File.swift
//  Concentration
//
//  Created by Hudson Pereira on 15/08/18.
//  Copyright © 2018 Hudson Pereira. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
    }
    
    init(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func pickCard(index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                // check if cards match
                if cards[index] == cards[matchingIndex] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                
            } else {
                // either no cards or 2 cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
            }
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
