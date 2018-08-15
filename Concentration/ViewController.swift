//
//  ViewController.swift
//  Concentration
//
//  Created by Hudson Pereira on 13/08/18.
//  Copyright © 2018 Hudson Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfCards: (cards.count + 1) / 2)
    
    var flipCount: Int = 0 { didSet {flipCountLabel.text = "Flips: \(flipCount)"} }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let index = cards.index(of: sender) {
            game.pickCard(index: index)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    } 
    
    var emojis = ["👻", "🎃", "📖", "🚀", "🤩", "😇"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojis.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            
            emoji[card.identifier] = emojis.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

