//
//  Loan.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import Foundation

class Loan : NSObject {
    
    //var client : Client
    var loanStatus = Status.Created //enum defined in Basic.swift
    var loanNumber  = 0
    var loanAmount : Int
    var interestRate : Float = 0
    var loanDuration : Int

    var compoundPeriod : Int = 0 // how often the interest is applied
    var currentRepaid = 0
    
    private var startTime : CFAbsoluteTime

    
    init(loanNumber : Int, loanStatus : Status, loanAmount: Int, interestRate : Float, loanDuration : Int, compoundPeriod : Int, currentRepaid : Int, startTime : CFAbsoluteTime){
        
        self.loanNumber = loanNumber
        self.loanStatus = loanStatus
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.interestRate = interestRate
        self.compoundPeriod = compoundPeriod
        self.currentRepaid = currentRepaid
        self.startTime = startTime
        
    }

    init(loanAmount : Int, interestRate : Float, loanDuration : Int,  compoundPeriod : Int, startTime : CFAbsoluteTime){
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.interestRate = interestRate
        self.compoundPeriod = compoundPeriod
        self.startTime = startTime
    }
    //for data saving
    func data() -> NSMutableDictionary{
        var data = NSMutableDictionary()
        data["loanStatus"] = self.loanStatus.rawValue
        data["loanNumber"] = self.loanNumber
        data["loanAmount"] = self.loanAmount
        data["interestRate"] = self.interestRate
        data["loanDuration"] = self.loanDuration
        data["compoundPeriod"] = self.compoundPeriod
        data["startTime"] = self.startTime
        return data
    }
    
    //Total payment expected after the loan duration
    var totalPayment : Int {
        return Int(Float(loanAmount)*(powf(1.0 + interestRate, Float(loanDuration)/Float(compoundPeriod))))
    }

    
    //Getters
    /*func getClient() -> Client{
        return self.client
    }*/
    func getLoanStatus() -> Status{
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
        approveLoan(true)
        
    }

    
    
    //Adds repaymentAmount to currentRepaid and returns remainder left to pay
    func updateRepayment(repaymentAmount : Int) -> Int{
        currentRepaid += repaymentAmount
        return totalPayment - currentRepaid
    }
    
    func returnTotalPayment(amount : Int, rate : Float, duration : Int, period : Int) -> Int{
        return Int(Float(amount)*(powf(1.0 + rate, Float(duration)/Float(period))))

    }
    
    func returnInitialNeg()->(Int, Float, Int, Int){
        return (loanAmount, interestRate, loanDuration, compoundPeriod)
    }
    
    func approveLoan(approval : Bool) -> Loan{
        if approval == true {
            self.startTime = CFAbsoluteTimeGetCurrent()
            self.loanStatus = .Ongoing
        }else{
            self.loanStatus = .Rejected
        }
        return self
    }
    
    func returnRemainingTime(passedTime : Int) -> Int{
        return loanDuration - passedTime
    }
    
}