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
    var currentStatus = NegStatus.Negotiated
    
    //Negotiation Values - Made it an tuple array to keep data of past negotiation values for this one portfolio
    var offers : [(Int, Float, Int, Int)] = [] //Tuple = (Amount, Interest Rate, Duration, Compound Period)
    
    init(client : Client, loan : Loan){
        self.client = client
        self.loan = loan
        
        self.offers.append((loan.getLoanAmount(),loan.getInterestRate(),loan.getLoanDuration(),loan.getCompoundPeriod()))
    }
    
    var latestOffer : (Int, Float, Int, Int){
        return offers[offers.count - 1]
    }
    
    var currentLoanStatus : Status {
        return loan.loanStatus
    }
    
    //Accepts loan and accepts the loan with currently accepted values
    func acceptLoan() -> Loan{
        loan.confirmNegotiation(offers[offers.count-1])
        currentStatus = .Accepted
        return loan.approveLoan(true)
    }
    
    func rejectLoan(){
        loan.approveLoan(false)
        currentStatus = .Rejected
    }
    
    
    func changeStatus(negStatus : NegStatus){
        currentStatus = negStatus
        
    }
    
    
    func processOffer(offer : (Int, Float, Int, Int)?)->NegStatus{
        
        var negStatus : NegStatus
        var playerOffer : (Int, Float, Int, Int)
        var receivedOffer : (Int, Float, Int, Int)
        
        if let playerOffer = offer{  //Player Negotiated (or Accepted)
            offers += [playerOffer]
            if compareLastTwo() == true { //Player Accepted
                acceptLoan()
            }else{  //Player Negotiated
                if let receivedOffer = offerToClient(playerOffer){ //Client Negotiated (or Accepted)
                    offers += [receivedOffer]
                    if compareLastTwo() == true{ //Client Accepted
                        acceptLoan()
                    }else{ //Client Negotiated
                        currentStatus = .Negotiated
                    }
                }else{ //Client Rejected
                    rejectLoan()
                }
            }
        }else{ //Player Rejected
            rejectLoan()
            
        }
        return currentStatus
    }
    
    func offerToClient(offer : (Int, Float, Int, Int)) -> (Int, Float, Int, Int)?{
        return client.negotiateOffer(offer)
    }
    
    func compareLastTwo()->Bool{
        if compareOffer(offers[offers.count-1], offers[offers.count-2]) == true {
            return true
        }else{
            return false
        }

    }
    
    

    
    
    
    
    
}
