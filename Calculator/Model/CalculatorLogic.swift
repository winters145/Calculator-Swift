//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jack Winterschladen on 09/08/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var intermediateCalculation: (firstNum: Double, calcMethod: String)?
    
    private var number: Double?
    
    mutating func setNumber(to number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "AC" {
                return 0
            } else if symbol == "=" {
                return performTwoNumCalculation(secondNum: n)
            } else {
                intermediateCalculation = (firstNum: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumCalculation(secondNum: Double) -> Double? {
        
        if let firstNum = intermediateCalculation?.firstNum, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return firstNum + secondNum
            case "-":
                return firstNum - secondNum
            case "×":
                return firstNum * secondNum
            case "÷":
                return firstNum / secondNum
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
