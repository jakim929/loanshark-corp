//
//  Loan.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import Foundation

class Loan {
    
    var client : Client
    var loanStatus : Int = 0 // 0 = pre-negotiation, 1 = negotiated/accepted/ongoing, 2 = paid, 3 = escaped, 4 = defaulted, 5 = rejected
    var loanAmount : Int
    var loanDuration : Int
    var interestRate : Float = 0
    var compoundPeriod : Int = 0 // how often the interest is applied
    var currentRepaid = 0
    
    init(client : Client, loanAmount : Int, loanDuration : Int, interestRate : Float, compoundPeriod : Int){
        self.client = client
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.interestRate = interestRate
        self.compoundPeriod = compoundPeriod
    }
    
    //Total payment expected after the loan duration
    var totalPayment : Int {
        return Int(Float(loanAmount)*(powf(1.0 + interestRate, Float(loanDuration)/Float(compoundPeriod))))
    }
    
    //Adds repaymentAmount to currentRepaid and returns remainder left to pay
    func updateRepayment(repaymentAmount : Int) -> Int{
        currentRepaid += repaymentAmount
        return totalPayment - currentRepaid
    }
    
    func approveLoan(approval : Bool) -> Loan{
        if approval == true {
            self.loanStatus = 1
        }else{
            self.loanStatus = 5
        }
        return self
    }
    
    func returnRemainingTime(passedTime : Int) -> Int{
        return loanDuration - passedTime
    }
    
}