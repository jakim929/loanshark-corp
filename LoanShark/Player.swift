//
//  Player.swift
//  LoanShark
//
//  Created by James Kim on 8/1/15.
//
//

import Foundation

class Player : NSObject{
    
    var name : String
    var gender : Bool
    var respectability : Int = 0
    var thugness : Int = 0
    var balance : Int = 1000
    var loanLedger = [Loan]()
    var openLoans = [Loan]()
    
    init(name : String, gender : Bool) {
        self.name = name
        self.gender = gender
    }
    
    

}

