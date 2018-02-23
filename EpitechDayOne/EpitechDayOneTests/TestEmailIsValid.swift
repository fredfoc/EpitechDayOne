//
//  TestEmailIsValid.swift
//  EpitechDayOneTests
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import EpitechDayOne

class TestEmailIsValid: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmailIsInvalid() {
        XCTAssertFalse("fredfoc".isValidEmail)
        XCTAssertFalse("fredfoc@fredfoc".isValidEmail)
        XCTAssertFalse("fredfoc@.com".isValidEmail)
    }
    
    func testEmailIsValid() {
        XCTAssertTrue("fredfoc@Fredfoc.com".isValidEmail)
    }
    
}
