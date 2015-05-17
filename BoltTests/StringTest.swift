//
//  StringTest.swift
//  Bolt
//
//  Created by William Falcon on 2/18/15.
//  Copyright (c) 2015 WilliamFalcon. All rights reserved.
//

import UIKit
import XCTest

class StringTest: XCTestCase {
    
    /**
    Author: William
    Tests string length property
    */
    func testLength() {
        var n : String?
        var a = ""
        var b = "b"
        var c = "bc"
        
        //run tests
        XCTAssert(a._length == 0, "Pass")
        XCTAssert(b._length == 1, "Pass")
        XCTAssert(c._length == 2, "Pass")
    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    */
}
