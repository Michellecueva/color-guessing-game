//
//  Counter.swift
//  ColorGuessingProgrammatically
//
//  Created by Michelle Cueva on 10/10/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct Counter {
    
    var currentScore = 0 {
        didSet{
            if self.currentScore > self.Highscore {
                self.Highscore = self.currentScore
            }
        }
    }
    
    var Highscore = 0
    
    mutating func addToCurrentScore() {
        currentScore += 1
    }
    
    mutating func resetCurrentScore() {
        currentScore = 0
    }
    
  
}
