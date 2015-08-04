//
//  Enforcer.swift
//  LoanShark
//
//  Created by James Kim on 8/4/15.
//
//

import Foundation


class Enforcer : NSObject{
    
    var name : String
    var gender : Bool
    var Strength : Int = 0
    var Invisibility : Int = 0
    
    
    
    init(name : String, gender : Bool) {
        self.name = name
        self.gender = gender
    }
    
}
    