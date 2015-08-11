//
//  Player.swift
//  LoanShark
//
//  Created by James Kim on 8/1/15.
//
//

import Foundation

public class Player : NSObject{
    
    public var clientTotal = 0
    
    var name : String = ""
    var gender : Bool = true
    var respectability : Int = 0
    var thugness : Int = 0
    var balance : Int = 1000
    var clientList = [Client]()
    var loanLedger = [Loan]()
    var enforcers = [Enforcer]()
    var portfolios = [Portfolio]()
    
    
    override init(){
    }
    
    init(name : String, gender : Bool) {
        self.name = name
        self.gender = gender
    }
    
    func setPlayer(name : String, gender : Bool, respectability : Int, thugness : Int, balance : Int){
        self.name = name
        self.gender = gender
        self.respectability = respectability
        self.thugness = thugness
        self.balance = balance
    }
    
    var currentPortfolio : Portfolio{
        return portfolios[portfolios.count-1]
    }
    var currentClient : Client{
        return clientList[clientList.count-1]
    }
    
    func data()->NSMutableDictionary{
        var data = NSMutableDictionary()
        data["name"] = self.name
        data["gender"] = self.gender
        data["respectability"] = self.respectability
        data["thugness"] = self.thugness
        data["balance"] = self.balance
        
        return data
    }
    
    func changeName(name : String){
        self.name = name
    }
    
    func changeGender(gender : Bool){
        self.gender = gender
    }
    
    func changeBalance(change : Int){
        balance += change
    }
    
    func negotiateOffer(offer : (Int, Float, Int, Int)?)->Portfolio{
        var status = currentPortfolio.processOffer(offer)
        
        if status == .Accepted{
            addToLedger(currentPortfolio)
        }
        return currentPortfolio
        
    }
    

    
    func addPortfolio(portfolio : Portfolio){
        portfolios.append(portfolio)
    }
/*
    func acceptOffer()->Loan{
        return currentPortfolio.acceptLoan()
    }
*/
    func addToLedger(portfolio : Portfolio){
        loanLedger.append(portfolio.loan)
    }
    
    
    

}

