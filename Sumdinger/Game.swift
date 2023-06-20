//
//  Game.swift
//  Sumdinger
//
//  Created by Zeta Lenhart-Boyd on 3/21/23.
//

import Foundation

struct Game {
    
    var deck = Deck()
    var hand: [Die]
    var selected: [Bool]
    
    init(handSize: Int) {
        hand = []
        selected = []
        
        for _ in 1 ... handSize {
            let index = Int.random(in: 0...5)
            let die = deck.get(index: index)
            hand.append(die)
            selected.append(false)
        }
    }
    
    mutating func updateSelected(at index: Int) {
        if selected[index] {
            selected[index] = false
        }
        else {
            selected[index] = true
        }
    }
    
    func seeDie(at index: Int) -> Die {
        let die = hand[index]
        return die
    }
    
}
