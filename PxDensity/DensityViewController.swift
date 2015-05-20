//
//  ViewController.swift
//  PxDensity
//
//  Created by focuspirit on 05/01/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit

class DensityViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var activeCellFrame: CGRect!
    var densityCalculator: DensityCalculator!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        densityCalculator = DensityCalculator()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleSingleTap:"))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tapGesture)
        
        self.tableView.tableFooterView = UIView()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self);

    }
    
    deinit {
    }

    func keyboardWillShow(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()

        if activeCellFrame.origin.y+activeCellFrame.size.height > keyboardFrame.origin.y-50 {
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.frame.origin.y = -(keyboardFrame.size.height-50)
            })
        }
        

    }
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.frame.origin.y = 0
        })
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return densityCalculator.densityTypeCount()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier( "DensityCell",
            forIndexPath: indexPath) as! DensityCell
        
        cell.index = indexPath.row
        
        let info = densityCalculator.getDesityInfoAtIndex(indexPath.row)
        if  info["type"] != nil {
            cell.densityRatio.text =  info["ratio"]
            cell.densityType.text = info["type"]
            cell.widthValue.text = info["width"]
            cell.heightValue.text = info["height"]
        }
        
        cell.calculateNeeded = self.recalculate
        cell.avoidKeyboard = self.avoidKeyboard
        return cell
    }
    
    func recalculate(index :Int, sender :DensityCell) {
        
        densityCalculator.calcNewTargetDensity(width: (sender.widthValue.text as NSString).doubleValue, height: (sender.heightValue.text as NSString).doubleValue, withIndex: index)
        
        self.tableView.reloadData()
        
    }
    
    func avoidKeyboard(index :Int, sender :DensityCell) {
        
        activeCellFrame = sender.frame
    }

    
}

