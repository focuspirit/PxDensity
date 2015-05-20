//
//  DensityCell.swift
//  PxDensity
//
//  Created by focuspirit on 05/01/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit

class DensityCell: UITableViewCell {

    @IBOutlet weak var densityType: UILabel!
    @IBOutlet weak var densityRatio: UILabel!
    @IBOutlet weak var widthValue: UITextField!
    @IBOutlet weak var heightValue: UITextField!
    
    var index: Int!
    var calculateNeeded: ((Int,DensityCell)->())!
    var avoidKeyboard: ((Int,DensityCell)->())!
    
    @IBAction func startEditing(sender: UITextField) {
        sender.textColor = UIColor.orangeColor()
        
        if (avoidKeyboard != nil ) {
            avoidKeyboard(index,self)
        }
        
    }
    
    
    @IBAction func finishedEditing(sender: UITextField) {
        sender.textColor = UIColor.lightGrayColor()
        
        if (calculateNeeded != nil) {
            calculateNeeded(index,self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        index = nil
    }
    
}
