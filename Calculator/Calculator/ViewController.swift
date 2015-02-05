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
    var operandStack = [Double]();
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set {
            display.text = "\(newValue)";
            userHasBegunTyping = false;
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if (operandStack.count >= 2) {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast());
            enter();
        }
    }
    
    func performOperation(operation: (Double) -> Double) {
        if (operandStack.count >= 1) {
            displayValue = operation(operandStack.removeLast());
            enter();
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
    
    @IBAction func enter() {
        userHasBegunTyping = false;
        operandStack.append(displayValue);
        println(operandStack);
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!;
        if (userHasBegunTyping) {
            enter();
        }
        
        switch operation {
        case "ⅹ":   performOperation { $0 * $1 }
        case "÷":   performOperation { $1 / $0 }
        case "＋":  performOperation { $0 + $1 }
        case "－":  performOperation { $1 - $0 }
        case "√":   performOperation { sqrt($0) }
        default: break;
            
        }
    }
}