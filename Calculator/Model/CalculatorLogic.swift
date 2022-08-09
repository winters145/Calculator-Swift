//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jack Winterschladen on 09/08/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    func calculate(symbol: String) -> Double? {
        
            if symbol == "+/-" {
                return number * -1
            } else if symbol == "%" {
                return number / 100
            } else if symbol == "AC" {
                return 0
            }
        
        return nil
    }
}
