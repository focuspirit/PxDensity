//
//  RatioCalculator.swift
//  PxDensity
//
//  Created by espiritu on 05/10/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit

class RatioCalculator: NSObject {

    private var value1 = 0
    private var value2 = 0
    
    var calculateResult = "1:1"
    var simpleRatio = "1:1"
    
    var firstNumber: Int {
        get {
            return value1
        }
        set {
            value1 = newValue
            calcRatio(number1: value1, number2: value2)
        }
    }
    
    var secondNumber: Int {
        get {
            return value2
        }
        set {
            value2 = newValue
            calcRatio(number1: value1, number2: value2)
        }
    }
    
    func calcRatio(#number1: Int, number2: Int) -> (Int, Int) {
        
        if number1>0 && number2>0 {
            
            
            var v = number1
            var u = number2
            var temp = 0
            while ( v != 0 ) {
                temp = u%v
                u = v
                v = temp
            }
            
            var r1 = number1/u
            var r2 = number2/u
            calculateResult = "\(r1):\(r2)"
            
            if r1>r2 {
                simpleRatio = "1:\(Float(Float(r2)/Float(r1)))"
            }
            if r2>r1 {
                simpleRatio = "\(Float( Float(r1)/Float(r2) )):1"
            }
            
            return (r1,r2)

        }
        return (0,0)
    }
    
}
