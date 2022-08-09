//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
                
        if let calcMethod = sender.currentTitle {
            
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil.")
            }
            
            displayValue = result
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {

                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double.")
                    }
                    
                    let isInt = floor(currentDisplayValue) == Double(currentDisplayValue)
                    
                    if !isInt || displayLabel.text == "0." {
                        return
                    }
                }
                displayLabel.text! += numValue
            }
        }
    }
}

