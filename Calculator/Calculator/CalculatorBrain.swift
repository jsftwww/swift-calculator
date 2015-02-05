//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Toyin Adedokun on 2/4/15.
//  Copyright (c) 2015 Toyin Adedokun. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]();
    private var knownOps = [String: Op]();
    
    init() {
        knownOps["ⅹ"] = Op.BinaryOperation("ⅹ", *);
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["＋"] = Op.BinaryOperation("＋", +)
        knownOps["－"] = Op.BinaryOperation("－") { $1 - $0 }
        knownOps["－"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        
        if (!ops.isEmpty) {
            var remainingOps = ops;
            let op = remainingOps.removeLast();
            
            switch op {
                case .Operand(let operand):
                    return (operand, remainingOps)
                
            default:
                break;
            }
        }
        
        return (nil, ops);
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand));
    }
    
    func performOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            opStack.append(operation);
        }
    }
    
}
