//
//  WithdrawValidator.swift
//  GraalBank
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import Foundation

// To go further, we can make a class for each validation type.
// Plus unit tests them independently.
// Unit tests may tests deeply these classes than acceptances tests on Account.

class WithdrawValidator {
    
    // MARK: - Constants
    
    private let overdraftAuthorized = -200.0
    
    // MARK: - Validation
    
    func validate(amount: Int, balance: Double) -> Bool {
        return isValidMultiple(amount)
            && isPositive(amount)
            && willNotMakeOverdraft(amount: amount, balance: balance)
    }
    
    private func isValidMultiple(_ amount: Int) -> Bool {
        return amount.isMultiple(of: 5)
    }
    
    private func isPositive(_ amount: Int) -> Bool {
        return amount >= 0
    }
    
    private func willNotMakeOverdraft(amount: Int, balance: Double) -> Bool {
        let balanceAfterWithdraw = balance - Double(amount)
        return balanceAfterWithdraw >= overdraftAuthorized
    }
}
