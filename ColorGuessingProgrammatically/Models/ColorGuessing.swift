//
//  ColorGuessing.swift
//  ColorGuessingProgrammatically
//
//  Created by Michelle Cueva on 10/9/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation
import UIKit

class ColorGuessing {
    
    private var currentColor: UIColor
    private var currentDominantRGBColor: UIColor
        
    func getNewColor() -> UIColor {
        let randomColorTuple = ColorGuessing.randColor()
        currentColor = randomColorTuple.color
        currentDominantRGBColor = randomColorTuple.dominantColor
        
        return currentColor
    }
    
    func isDominant(guess: UIColor) -> Bool {
        return currentDominantRGBColor == guess
    }
        
    static private func randColor() -> (color: UIColor, dominantColor: UIColor) {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        let color = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        let dominantColor: UIColor
        if max(redValue, greenValue, blueValue) == redValue {
            dominantColor = UIColor.red
        } else if max(redValue, greenValue, blueValue) == greenValue {
            dominantColor = UIColor.green
        } else {
            dominantColor = UIColor.blue
        }
        return (color, dominantColor)
        
    }
    
    init() {
        let randomColorTuple = ColorGuessing.randColor()
        let currentColor = randomColorTuple.color
        let currentDominantColor = randomColorTuple.dominantColor
        
        self.currentColor = currentColor
        self.currentDominantRGBColor = currentDominantColor
    }
}
