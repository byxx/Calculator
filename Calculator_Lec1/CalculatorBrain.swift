//
//  CalculatorBrain.swift
//  Calculator_Lec1
//
//  Created by byxx on 12.07.17.
//  Copyright © 2017 byxx. All rights reserved.
//

import Foundation
func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    //Zwischenspeicher ??
    private var accumulator: Double?
    
    private enum Operation {
        case constant (Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operations: Dictionary<String, Operation> =
        [
            "π" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation(sqrt),
            "cos" : Operation.unaryOperation(cos),
            "±": Operation.unaryOperation(changeSign)
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant (let value):
                accumulator = value
            case .unaryOperation (let function):
                if accumulator != nil {
                accumulator = function(accumulator!)
                }
                break
            }
        }
           }
    
    
    //Mutating func changes value of this struct
    mutating func setOperand (_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
           return accumulator
        }
    }
}
