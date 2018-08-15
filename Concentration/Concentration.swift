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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        [Int]().shuf
    }
    
    func pickCard(index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                // check if cards match
                if cards[index].identifier == cards[matchingIndex].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                // either no cards or 2 cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
