//
//  Picker.swift
//  Sumdinger
//
//  Created by Zeta Lenhart-Boyd on 3/21/23.
//

import Foundation
import SwiftUI

class Picker: ObservableObject {
    
    @Published private var game = Game(handSize: 5)
    
    // create array of all possible sums
    var usedSums: [Bool]
    // set to false to indicate they have not been used yet
    init() {
        usedSums = []
        for _ in 2...12 {
            usedSums.append(false)
        }
    }
    
    func see(at index: Int) -> Die {
        return game.seeDie(at: index)
    }
    
    // changes usedSums at an index to true if they have been used then rolls new die by begining a "new game"
    func roll() {
        var sum = 0
        for index in 0...game.hand.count-1 {
            if game.selected[index] == true {
                sum = sum + game.hand[index].value
            }
        }
        if sum > 2 && sum < 12 {
            usedSums[sum-2] = true
        }
        game = Game(handSize: 5)
    }
    
    func tap(at index: Int) {
        game.updateSelected(at: index)
    }
    
    func isSelected(at index: Int) -> Bool {
        return game.selected[index]
    }
    
    // displays values of all selected die
    var selectedText: String {
        var text = "["
        for index in 0...game.hand.count-1 {
            if game.selected[index] == true {
                text += String(game.hand[index].value) + " "
            }
        }
        text += "]"
        return text
    }
    
    // displays sum of the values of all selected die
    var sumText: String {
        var sum = 0
        for index in 0...game.hand.count-1 {
            if game.selected[index] == true {
                sum = sum + game.hand[index].value
            }
        }
        return String(sum)
    }
    
    // disables the roll function if the selected count isnt 0 or if the sum of the selected has been used before
    var canIRoll: Bool {
        var count = 0
        var sum = 0
        // keep track of count
        for index in 0...game.hand.count-1 {
            if game.selected[index] == true {
                count += 1
            }
        }
        // keep track of sum
        for index in 0...game.hand.count-1 {
            if game.selected[index] == true {
                sum = sum + game.hand[index].value
            }
        }
        // enable the roll
        if count == 2 && !usedSums[sum-2] {
            return false
        }
        // disable the roll
        else {
            return true
        }
    }
    
    // changes the color of the sum depending on if it has been used or not
    func usedColor(sum: Int) -> Color {
        if usedSums[sum - 2] {
            return Color.blue
        }
        else {
            return Color.black
        }
    }
}


