//
//  ViewController.swift
//  ConcentrationCopy
//
//  Created by Sky on 4/11/19.
//  Copyright © 2019 OU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 ) / 2)
    var flipCount = 0 {
                didSet {
                    flipCountLabel.text = "Flips: \(flipCount)"
                }
            }

    @IBOutlet weak var flipCountLabel: UILabel!
//    var emojiChoices = ["👻", "👻", "🚌", "🚌"]
    var emojiChoices = ["🐶", "🐱", "🌻", "🥑", "🍕", "⚽️", "🏹", "🚌"]
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1

        let cardNumber = cardButtons.index(of: sender)
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("chosen card was not int cardBuutons")
        }

    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.6898569423, blue: 0.2088818223, alpha: 0) : #colorLiteral(red: 1, green: 0.6898569423, blue: 0.2088818223, alpha: 1)
                
            }
        }
    }
    
    var emoji = Dictionary<Int, String>()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

    
    
    
}

