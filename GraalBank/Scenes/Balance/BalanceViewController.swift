//
//  BalanceViewController.swift
//  GraalBank
//
//  Created by Jordan on 16/02/2020.
//  Copyright © 2020 ChapuyJ. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var withdrawButton: UIButton!
    @IBOutlet private weak var depositButton: UIButton!
    
    // MARK: - Vars
    
    private let account = Account(balance: 100)
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayBalance()
    }
    // MARK: - Withdraw
    
    @IBAction func didTapWithdraw(_ sender: Any) {
        if let input = inputTextField.text, let number = Int(input) {
            account.withdraw(amount: number)
        }
        
        displayBalance()
        cleanInputText()
    }
    
    // MARK: - Deposit
    
    @IBAction func didTapDeposit(_ sender: Any) {}
    
    // MARK: - Text Fields
    
    private func displayBalance() {
        amountLabel.text = "\(account.balance) €"
    }
    
    private func cleanInputText() {
        inputTextField.text = ""
    }
}
