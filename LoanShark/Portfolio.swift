//
//  Portfolio.swift
//  LoanShark
//
//  Created by James Kim on 8/4/15.
//
//

import Foundation

class Portfolio : NSObject {
    
    var client : Client
    var loan : Loan
    var offerMatched : Bool = false
    var currentStatus : Int = 1
    
    //Negotiation Values - Made it an tuple array to keep data of past negotiation values for this one portfolio
    var negotiations : [(Int, Float, Int, Int)] = [] //Tuple = (Amount, Interest Rate, Duration, Compound Period)
    
    init(client : Client, loan : Loan){
        self.client = client
        self.loan = loan
        
        self.negotiations.append((loan.getLoanAmount(),loan.getInterestRate(),loan.getLoanDuration(),loan.getCompoundPeriod()))
    }
    
    var latestOffer : (Int, Float, Int, Int){
        return negotiations[negotiations.count - 1]
    }
    
    var currentLoanStatus : Int {
        return loan.loanStatus
    }
    
    //Accepts loan and accepts the loan with currently accepted values
    func acceptLoan() -> Loan{
        loan.confirmNegotiation(negotiations[negotiations.count-1])
        return loan.approveLoan(true)
    }
    
    func rejectLoan(){
        loan.approveLoan(false)
    }
    
    func changeStatus(status : Int){
        currentStatus = status
        
    }
    
    func addNegotiation(a: (Int, Float, Int, Int)){
        negotiations += [a]
    }
    
    func offerToClient(offer : (Int, Float, Int, Int)) -> (Int, Float, Int, Int)?{
        return client.negotiateOffer(offer)
    }
    
    

    
    
    
    
    
}
