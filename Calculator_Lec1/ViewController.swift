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
    
    

    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        let operand = sender.currentTitle!
        
        //Casting von String in Double
        switch operand {
        case "π":
        display.text = "3.14"
            
            //Checken!!
        case "√":
            let rootValue = Double(operand)
            let rootResult = sqrt(rootValue!)
            display.text = String(rootResult)
            
        default:
            break
        }
    }
    
    
}

