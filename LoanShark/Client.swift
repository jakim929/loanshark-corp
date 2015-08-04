//
//  Client.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//
//james is stupid

import Foundation

class Client : NSObject{
    
    var clientNumber : Int
    var name : String
    var age : Int
    var occupation : String
    var loanHistory = [Loan]()
    var currentLoan : Loan
    var creditRating : Int
    var anxietyRating : Int = 0
    var netWorth : Int
    //var personality : Int
    
    init(clientNumber : Int, name : String, age : Int, occupation : String, currentLoan : Loan, creditRating : Int, netWorth : Int){
        self.clientNumber = clientNumber
        self.name = name
        self.age = age
        self.occupation = occupation
        self.currentLoan = currentLoan
        self.creditRating = creditRating
        self.netWorth = netWorth
    }
    
//Getters
    
    func getClientNumber() -> Int{
        return self.clientNumber
    }
    func getName() -> String{
        return self.name
    }
    func getAge() -> Int{
        return self.age
    }
    func getOccupation() -> String{
        return self.occupation
    }
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
    
    
    func repayLoan(paymentAmount : Int){
        self.currentLoan.updateRepayment(paymentAmount)
    }
    
    func updateAnxiety(anxietyAmount : Int){
        self.anxietyRating += anxietyAmount
    }
    

    
}
