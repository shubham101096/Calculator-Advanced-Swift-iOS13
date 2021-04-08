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
    
    private var isFinishedTypingNumber = true
    private var didPressDecimalPointBtn = false
    
    private var displayValue: Double {
        get {
            let displayText = displayLabel.text!
            guard let number = Double(displayText) else { fatalError("Cannot convert display text to double") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        didPressDecimalPointBtn = false
        guard let senderTitle = sender.currentTitle else {
            fatalError("Sender title nil")
        }
        
        let calculator = Calculator(num: displayValue)
        guard let result = calculator.performCalculation(op: senderTitle) else { fatalError("Result was nil") }
        displayValue = result

//        if senderTitle == "AC" {
//            displayValue = 0
//
//        } else if senderTitle == "+/-" && displayLabel.text != "0" {
//            displayValue *= -1
//
//        } else if senderTitle == "%" && displayLabel.text != "0" {
//            displayValue *= 0.01
//        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let displayText = displayLabel.text, let senderTitle = sender.currentTitle {
            if senderTitle == "." {
                if didPressDecimalPointBtn {
                    return
                } else {
                    didPressDecimalPointBtn = true
                }
            }
            if isFinishedTypingNumber {
                displayLabel.text = senderTitle
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayText + senderTitle
            }
        }
    }
}

