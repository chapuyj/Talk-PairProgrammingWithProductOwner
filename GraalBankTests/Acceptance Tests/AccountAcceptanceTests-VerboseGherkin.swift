//
//  AccountAcceptanceTests-VerboseGherkin.swift
//  GraalBankTests
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import XCTest
@testable import GraalBank

// Written tests by pair programming with a Product Owner.
// Based on acceptance tests written together when we created the story.
//
// Another version where tests are more verbose.
// The Product Owner should be capable to write some of them.

class AccountAcceptanceTestsVerboseGherkin: XCTestCase {
    
    // MARK: - Vars
    
    private var account: Account!
    
    // MARK: - Setups
    
    override func tearDown() {
        self.account = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testWithdraw_withValidAmount() {
        givenAccount(initialBalance: 100)
        whenWithdraw(amount: 25)
        balanceShouldEqual(to: 75)
    }
    
    func testWithdraw_withInvalidMultipleAmount() {
        givenAccount(initialBalance: 100)
        whenWithdraw(amount: 12)
        balanceShouldEqual(to: 100)
    }
    
    func testWithdraw_withNegativeAmount() {
        givenAccount(initialBalance: 100)
        whenWithdraw(amount: -50)
        balanceShouldEqual(to: 100)
    }
    
    func testWithdraw_withOverdraft() {
        givenAccount(initialBalance: 100)
        whenWithdraw(amount: 500)
        balanceShouldEqual(to: 100)
    }
    
    // MARK: - Gherkin Helpers
    
    private func givenAccount(initialBalance: Double) {
        self.account = Account(balance: initialBalance)
    }
    
    private func whenWithdraw(amount: Int) {
        self.account.withdraw(amount: amount)
    }
    
    private func balanceShouldEqual(to value: Double, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(account.balance, value, file: file, line: line)
    }
}
