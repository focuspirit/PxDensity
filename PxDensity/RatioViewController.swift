//
//  RatioViewController.swift
//  PxDensity
//
//  Created by focuspirit on 05/02/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit

class RatioViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var calculateResult: UILabel!
    @IBOutlet weak var simpleRatio: UILabel!
    
    var ratioCalculator: RatioCalculator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ratioCalculator = RatioCalculator()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleSingleTap:"))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tapGesture)
        
        number1.text = toString(ratioCalculator.firstNumber)
        number2.text = toString(ratioCalculator.secondNumber)
        calculateResult.text = ratioCalculator.calculateResult
        simpleRatio.text = ratioCalculator.simpleRatio
    
        
    }
    
    func handleSingleTap(gesture: UIGestureRecognizer) {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startEditing(sender: UITextField) {
        sender.textColor = UIColor.orangeColor()
    }
    
    
    @IBAction func finishedEditing(sender: UITextField) {
        sender.textColor = UIColor.lightGrayColor()
        
        
        if !number1.text.isEmpty && !number2.text.isEmpty {
            if let v1 = number1.text.toInt(), let v2 = number2.text.toInt() where (v1 > 0) && (v2 > 0) {
                
                ratioCalculator.firstNumber = v1
                ratioCalculator.secondNumber = v2
                calculateResult.text = ratioCalculator.calculateResult
                simpleRatio.text = ratioCalculator.simpleRatio
                
                
            }
        }
        
    }
    

}
