//
//  Account.swift
//  GraalBank
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import Foundation

// To go further, we can make a framework and move these classes inside.
// We will ensure that it will concern only domain rules and use cases.
// No UI, no database, no network, no platform related things, etc.

class Account {
    
    // MARK: - Vars
    
    private(set) var balance: Double
    
    // MARK: - Init
    
    init(balance: Double) {
        self.balance = balance
    }
    
    // MARK: - Withdraw
    
    func withdraw(amount: Int) {
        guard WithdrawValidator().validate(amount: amount, balance: balance) else {
            return
        }
        
        makeWithdraw(amount)
    }
    
    private func makeWithdraw(_ amount: Int) {
        self.balance -= Double(amount)
    }
}
