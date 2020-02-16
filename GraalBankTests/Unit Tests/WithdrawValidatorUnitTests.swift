//
//  WithdrawValidatorUnitTests.swift
//  GraalBankTests
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import XCTest
@testable import GraalBank

// Quick unit tests to ensure that validation behave like we want at edge cases.

class WithdrawValidatorUnitTests: XCTestCase {
    
    // MARK: - Valid tests
    
    func testWithdrawValidator_balanceAfterWithdrawIs50() {
        let withdrawValidator = WithdrawValidator()
        let isValid = withdrawValidator.validate(amount: 50, balance: 100)
        XCTAssertTrue(isValid)
    }
    
    // MARK: - Overdraft tests
    
    func testWithdrawValidator_balanceAfterWithdrawIsMinus199() {
        let withdrawValidator = WithdrawValidator()
        let isValid = withdrawValidator.validate(amount: 100, balance: -99)
        XCTAssertTrue(isValid)
    }
    
    func testWithdrawValidator_balanceAfterWithdrawIsMinus200() {
        let withdrawValidator = WithdrawValidator()
        let isValid = withdrawValidator.validate(amount: 100, balance: -100)
        XCTAssertTrue(isValid)
    }
    
    func testWithdrawValidator_balanceAfterWithdrawIsMinus201() {
        let withdrawValidator = WithdrawValidator()
        let isValid = withdrawValidator.validate(amount: 100, balance: -101)
        XCTAssertFalse(isValid)
    }
}
