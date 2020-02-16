//
//  AccountAcceptanceTests.swift
//  GraalBankTests
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import XCTest
@testable import GraalBank

// Written tests by pair programming with a Product Owner.
// Based on acceptance tests written together when we created the story.

class AccountAcceptanceTests: XCTestCase {
    
    func testWithdraw_withValidAmount() {
        let account = Account(balance: 100)
        account.withdraw(amount: 25)
        XCTAssertEqual(account.balance, 75)
    }
    
    func testWithdraw_withInvalidMultipleAmount() {
        let account = Account(balance: 100)
        account.withdraw(amount: 12)
        XCTAssertEqual(account.balance, 100)
    }
    
    func testWithdraw_withNegativeAmount() {
        let account = Account(balance: 100)
        account.withdraw(amount: -50)
        XCTAssertEqual(account.balance, 100)
    }
    
    func testWithdraw_withOverdraft() {
        let account = Account(balance: 100)
        account.withdraw(amount: 500)
        XCTAssertEqual(account.balance, 100)
    }
}
