//
//  ViewController.swift
//  Calculator_Lec1
//
//  Created by byxx on 12.07.17.
//  Copyright © 2017 byxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
    
        if (userIsInTheMiddleOfTyping) {
        let digit = sender.currentTitle!
        display.text = display.text! + digit
        } else {
            display.text = sender.currentTitle!
            userIsInTheMiddleOfTyping = true
        }
    }
    
    //Computed Property converts only
    var displayValue: Double {
    get {
    return Double(display.text!)!
    }
    set {
    display.text! = String(newValue)
    }
    }

    private var brain = CalculatorBrain()
    
    
    @IBAction func performOperation(_ sender: UIButton) {
       
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
        brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
        displayValue = result
    }
        
        //end of PerformOperation()
    
    
}
}

