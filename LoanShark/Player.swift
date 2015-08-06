//
//  Player.swift
//  LoanShark
//
//  Created by James Kim on 8/1/15.
//
//

import Foundation

class Player : NSObject{
    
    var name : String = ""
    var gender : Bool = true
    var respectability : Int = 0
    var thugness : Int = 0
    var balance : Int = 1000
    var clientList = [Client]()
    var loanLedger = [Loan]()
    var enforcers = [Loan]()
    var portfolios = [Portfolio]()
    
    override init(){
    }
    
    init(name : String, gender : Bool) {
        self.name = name
        self.gender = gender
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
    
    
    

}

