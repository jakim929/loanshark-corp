//
//  Client.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import Foundation

class Client : NSObject {
    
    var clientNumber : Int = 1
    var name : String
    //var age : Int
    var loanHistory = [Loan]()
    var currentLoan = Loan()
    var creditRating : Int
    var netWorth : Int
    var pastExperience : Int = 0
    var anxietyRating : Int = 0
    //var personality : Int
    
    override init(){
        name = ""
        creditRating = 1
        netWorth = 0
    }
    
    init(name : String, creditRating : Int, netWorth : Int){
        //clientNumber = 1
        self.name = name
        self.creditRating = creditRating
        self.netWorth = netWorth

    }
    
    var clientDescription : String{
        return "Client Information\nName: \(name)\nCredit Rating: \(creditRating)\nNet Worth: \(netWorth)"
    }
/*
    init(clientNumber : Int, name : String, age : Int, currentLoan : Loan, creditRating : Int, netWorth : Int){
        self.clientNumber = clientNumber
        self.name = name
        self.age = age
        self.currentLoan = currentLoan
        self.creditRating = creditRating
        self.netWorth = netWorth
    }
*/
//Getters
    
    func getClientNumber() -> Int{
        return self.clientNumber
    }
    func getName() -> String{
        return self.name
    }
/*func getAge() -> Int{
        return self.age
    }
    func getOccupation() -> String{
        return self.occupation
    }
*/
    func getLoanHistory() -> [Loan]{
        return self.loanHistory
    }
    func getCurrentLoan() -> Loan{
        return self.currentLoan
    }
    func getCreditRating() -> Int{
        return self.creditRating
    }
    func getAnxietyRating() -> Int{  //Fix Later
        return self.anxietyRating
    }
    func getNetWorth() -> Int{
        return self.netWorth
    }

//Other functions
    
    func repayLoan(paymentAmount : Int){
        self.currentLoan.updateRepayment(paymentAmount)
    }
    
    func updateAnxiety(anxietyAmount : Int){
        self.anxietyRating += anxietyAmount
    }
    
    func proposeLoan()->Loan{
        
        let amount = Random.simpleRandomScaled(1000, max: 100000, scale: 1000)
        let rate = Random.simpleRandomFloat(0.1, max: 0.4)
        let duration = Random.simpleRandom(50, max : 100)
        let period = 10
        currentLoan = Loan(loanAmount: amount, interestRate: rate, loanDuration: duration, compoundPeriod: period)
        return currentLoan
    }
    
    func negotiateOffer(a : (Int, Float, Int, Int))->  (Int, Float, Int, Int)?
    {
        var negTotal = currentLoan.returnTotalPayment(a.0, rate: a.1, duration: a.2, period: a.3)
        var returnOffer : (Int, Float, Int, Int)
        
        if evaluateOffer(a) == 1{
            returnOffer = a
        }else if evaluateOffer(a) == 3{
            rejectOffer()
            return nil // nil when rejected
        }else{
            returnOffer = self.currentLoan.returnInitialNeg()
        }
        
        return returnOffer
        
    }
    
    func evaluateOffer(a : (Int,Float,Int,Int))->Int{       //1: Accept, 2: Keep Negotiating, 3: Reject
        var negTotal = currentLoan.returnTotalPayment(a.0, rate: a.1, duration: a.2, period: a.3)
        if currentLoan.totalPayment >= negTotal{
            return 1
        }else if currentLoan.totalPayment * 2 <= negTotal{
            return 3
        }else{
            return 2
        }
        
        
    }
    
    func rejectOffer(){
        
    }

    

    
}
