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
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        
        if (userHasBegunTyping) {
            (display.text)! += digit;
        } else {
            display.text = digit;
            userHasBegunTyping = true;
        }
    }
    
    @IBAction func clear() {
        display.text = "0";
        userHasBegunTyping = false;
    }
    
}