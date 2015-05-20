//
//  PxDensityTests.swift
//  PxDensityTests
//
//  Created by espiritu on 05/01/15.
//  Copyright (c) 2015 focuspirit. All rights reserved.
//

import UIKit
import XCTest

class PxDensityTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRatioCalculator() {
        var ratioCalculator = RatioCalculator()
        
        ratioCalculator.firstNumber = 1
        XCTAssertEqual(ratioCalculator.firstNumber, 1, "should be 1")

        ratioCalculator.secondNumber = 1
        XCTAssertEqual(ratioCalculator.secondNumber, 1, "should be 1")
        
        var (v1, v2) = ratioCalculator.calcRatio(number1: 414, number2: 736)
        
        XCTAssertEqual(v1, 9, "should be 9")
        XCTAssertEqual(v2, 16, "should be 16")
        
        ratioCalculator.calcRatio(number1: 200, number2: 400)
        
        XCTAssertTrue(ratioCalculator.simpleRatio == "0.5:1", "should be 0.5:1")
    }
    
    func testDensityCalculator() {
        
        var densityCalculator = DensityCalculator()
        
        var count = densityCalculator.densityTypeCount()
        var overIndexInfo = densityCalculator.getDesityInfoAtIndex(count+1)
        
        
        XCTAssertNotNil(overIndexInfo, "should not nil")
        XCTAssertEqual(overIndexInfo.count, 0, "should be 0")

        densityCalculator.calcNewTargetDensity(width: 100, height: 200, withIndex: 0)
        
        var info = densityCalculator.getDesityInfoAtIndex(1)
        
        XCTAssertTrue(info["width"] == "134", "should be 134")
        XCTAssertTrue(info["height"] == "267", "should be 267")
        
    }
    
    
}
