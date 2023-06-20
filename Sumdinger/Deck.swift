//
//  Deck.swift
//  Sumdinger
//
//  Created by Zeta Lenhart-Boyd on 3/21/23.
//

import Foundation

struct Deck {
    
    var myDice: [Die]
    
    static let possibleValues = [1, 2, 3, 4, 5, 6]
    
    init() {
        myDice = []
        
        for possibleValue in Deck.possibleValues {
            let die = Die(value: possibleValue)
            myDice.append(die)
        }
        
        myDice.shuffle()
    }
    
    func get(index: Int) -> Die {
        return myDice[index]
    }
}
