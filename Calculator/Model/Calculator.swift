//
//  Calculator.swift
//  Calculator
//
//  Created by Shubham Mishra on 08/04/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, op: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func performOp(n2: Double) -> Double? {
        guard let tuple = intermediateCalculation else {
            return nil
        }
        
        let n1 = tuple.n1
        let op = tuple.op
        
        switch op {
        case "+":
            return n1+n2
        case "-":
            return n1-n2
        case "×":
            return n1*n2
        case "÷":
            return n1/n2
        default:
            return nil
        }
    }
    
    mutating func performCalculation(op: String) -> Double? {
        if let n = number {
            switch op {
            case "AC":
                return 0
            case "+/-":
                return n*(-1)
            case "%":
                return n*0.01
            case "=":
                return performOp(n2: n)
            default:
                intermediateCalculation = (n1: n, op: op)
            }
        }
        return nil
    }
}
