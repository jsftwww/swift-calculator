//
//  ViewController.swift
//  Calculator
//
//  Created by Toyin Adedokun on 1/29/15.
//  Copyright (c) 2015 Toyin Adedokun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!;
    var userHasBegunTyping = false;
    var brain = CalculatorBrain();
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set {
            display.text = "\(newValue)";
            userHasBegunTyping = false;
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        
        if (userHasBegunTyping) {
            display.text = display.text! + digit;
        } else {
            display.text = digit;
            userHasBegunTyping = true;
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if (userHasBegunTyping) {
            enter();
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result;
            } else {
                displayValue = 0;
            }
        }
    }
    
    @IBAction func enter() {
        userHasBegunTyping = false;
        
        if let result = brain.pushOperand(displayValue) {
            displayValue = result;
        } else {
            displayValue = 0;
        }
    }
}