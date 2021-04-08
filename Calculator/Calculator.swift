//
//  Calculator.swift
//  Calculator
//
//  Created by Shubham Mishra on 08/04/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

class Calculator {
    var number: Double
    
    init(num: Double) {
        self.number = num
    }
    
    func performCalculation(op: String) -> Double? {
        switch op {
        case "AC":
            return 0
        case "+/-":
            return number*(-1)
        case "%":
            return number*0.01
        default:
            return nil
        }
    }
}
