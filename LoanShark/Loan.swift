//
//  Loan.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import Foundation

class Loan : NSObject {
    
    var client : Client
    var loanStatus : Int = 0 // 0 = pre-negotiation, 1 = negotiated/accepted/ongoing, 2 = paid, 3 = escaped, 4 = defaulted, 5 = rejected
    var loanAmount : Int
    var loanDuration : Int
    var interestRate : Float = 0
    var compoundPeriod : Int = 0 // how often the interest is applied
    var currentRepaid = 0
    
    
    init(client : Client, loanAmount : Int, interestRate : Float, loanDuration : Int,  compoundPeriod : Int){
        self.client = client
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.interestRate = interestRate
        self.compoundPeriod = compoundPeriod
    }
    
    //Getters
    func getClient() -> Client{
        return self.client
    }
    func getLoanStatus() -> Int{
        return self.loanStatus
    }
    func getLoanAmount() -> Int{
        return self.loanAmount
    }
    func getLoanDuration() -> Int{
        return self.loanDuration
    }
    func getInterestRate() -> Float{
        return self.interestRate
    }
    func getCompoundPeriod() -> Int{
        return self.compoundPeriod
    }
    func getCurrentRepaid() -> Int{
        return self.currentRepaid
    }
    
    //Grouped Setters
    func confirmNegotiation(loanAmount : Int, interestRate : Float, loanDuration : Int, compoundPeriod : Int){
        self.loanAmount = loanAmount
        self.interestRate = interestRate
        self.loanDuration = loanDuration
        self.compoundPeriod = compoundPeriod
    }
    
    func confirmNegotiation(negotiation :(Int, Float, Int, Int)){
        self.loanAmount = negotiation.0
        self.interestRate = negotiation.1
        self.loanDuration = negotiation.2
        self.compoundPeriod = negotiation.3
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