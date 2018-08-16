//
//  Card.swift
//  Concentration
//
//  Created by Hudson Pereira on 15/08/18.
//  Copyright © 2018 Hudson Pereira. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    private var identifier: Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
