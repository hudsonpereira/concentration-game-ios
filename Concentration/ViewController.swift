//
//  ViewController.swift
//  Concentration
//
//  Created by Hudson Pereira on 13/08/18.
//  Copyright © 2018 Hudson Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    var emojis = ["👻", "🎃", "👻", "🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cards.index(of: sender) {
            flipCard(withEmoji: emojis[index], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        flipCount += 1
        
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

