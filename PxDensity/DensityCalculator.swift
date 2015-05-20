//
//  DensityCalculator.swift
//  PxDensity
//
//  Created by espiritu on 05/10/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit

class DensityCalculator: NSObject {
   
    private var baseWidth = 320.0
    private var baseHeight = 480.0
    private var densityRatio = [0.75, 1.0, 1.33, 1.5, 2.0,3.0,4.0]
    private var densityType = ["LDPI", "BASE/MDPI", "TVDPI", "HDPI", "RETINA/XHDPI","XXHDPI", "XXXHDPI"]

    private var widthInfo:[Int] = []
    private var heightInfo:[Int] = []
    
    override init() {
        super.init()

        widthInfo = Array<Int>(count:densityType.count, repeatedValue: 0)
        heightInfo = Array<Int>(count:densityType.count, repeatedValue: 0)
        
        calcDensity(width: baseWidth, height: baseHeight)
    }
    
    func densityTypeCount() -> Int {
        return densityType.count
    }
    
    func getDesityInfoAtIndex(index: Int) -> Dictionary<String, String> {
        
        if index>=0 && index<densityTypeCount() {

            return ["ratio": "\(densityRatio[index])x",
                "type": densityType[index],
                "width": "\(widthInfo[index])",
                "height": "\(heightInfo[index])" ]
        }
        return [:]
    }
    
    
    func calcNewTargetDensity(#width: Double, height: Double, withIndex index: Int) -> (Double,Double) {
        baseWidth = width / densityRatio[index]
        baseHeight = height / densityRatio[index]
        
        calcDensity(width: baseWidth, height: baseHeight)

        return (baseWidth,baseHeight)
    }
    
    private func calcDensity(#width: Double, height: Double) {
        for (index, density) in enumerate(densityRatio) {
            widthInfo[index] = Int(ceil(baseWidth * density))
            heightInfo[index] = Int(ceil(baseHeight * density))
        }
    }
    
    
}
