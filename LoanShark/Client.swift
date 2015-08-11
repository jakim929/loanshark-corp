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
    
    var creditRating : Int
    var netWorth : Int
    var pastExperience : Int = 0
    var anxietyRating : Int = 0
    
    var loanList = [Loan]()
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
    
    init(clientNumber : Int, name : String, creditRating : Int, netWorth : Int, pastExperience : Int, anxietyRating : Int, loanList : [Loan]){
        self.clientNumber = clientNumber
        self.name = name
        self.creditRating = creditRating
        self.netWorth = netWorth
        self.pastExperience = pastExperience
        self.anxietyRating = anxietyRating
        self.loanList = loanList
    }
    
    var currentLoan : Loan{
        return loanList[loanList.count - 1]
    }
    
    var clientDescription : String{
        return "Client Information\nName: \(name)\nCredit Rating: \(creditRating)\nNet Worth: \(netWorth)"
    }

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
    func getLoanList() -> [Loan]{
        return self.loanList
    }
/*    func getCurrentLoan() -> Loan{
        return self.currentLoan
    }*/
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
    //For saving data
    func data() -> NSDictionary {
        var data = NSMutableDictionary()
        data["clientNumber"] = self.clientNumber
        data["name"] = self.name
        data["creditRating"] = self.creditRating
        data["netWorth"] = self.netWorth
        data["pastExperience"] = self.pastExperience
        data["anxietyRating"] = self.anxietyRating
        var loanData = [NSMutableDictionary]()
        for loan in loanList {
            loanData.append(loan.data())
        }
        data["loanList"] = loanData
        return data
    }
    
    func repayLoan(paymentAmount : Int){
        self.currentLoan.updateRepayment(paymentAmount)
    }
    
    func updateAnxiety(anxietyAmount : Int){
        self.anxietyRating += anxietyAmount
    }
    
    func proposeLoan()->Loan{
        
        let amount = simpleRandomScaled(1000, 100000, 1000)
        let rate = simpleRandomFloat(0.1, 0.4)
        let duration = simpleRandom(50, 100)
        let period = 10
        let startTime = CFAbsoluteTimeGetCurrent()
        loanList.append(Loan(loanAmount: amount, interestRate: rate, loanDuration: duration, compoundPeriod: period, startTime: startTime))
        return currentLoan
    }
    
    func negotiateOffer(a : (Int, Float, Int, Int))->  (Int, Float, Int, Int)?
    {
        var negTotal = currentLoan.returnTotalPayment(a.0, rate: a.1, duration: a.2, period: a.3)
        var returnOffer : (Int, Float, Int, Int)
        
        if evaluateOffer(a) == .Accepted{
            returnOffer = a
        }else if evaluateOffer(a) == .Rejected{
            rejectOffer()
            return nil // nil when rejected
        }else{
            returnOffer = self.currentLoan.returnInitialNeg()
        }
        
        return returnOffer
        
    }
    
    func evaluateOffer(a : (Int,Float,Int,Int))->NegStatus{
        var negTotal = returnTotalPayment(a.0, a.1, a.2, a.3)
        if currentLoan.totalPayment >= negTotal{
            return .Accepted
        }else if currentLoan.totalPayment * 2 <= negTotal{
            return .Rejected
        }else{
            return .Negotiated
        }
        
        
    }
    
    func rejectOffer(){
        
    }

    

    
}
