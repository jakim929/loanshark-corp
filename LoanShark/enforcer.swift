//
//  enforcer.swift
//  LoanShark
//
//  Created by Abdulrahman Jamjoom on 8/4/15.
//
//

import Foundation


    class enforcer : NSObject{
        
        var name : String
        var gender : Bool
        var Strength : Int = 0
        var Invisibility : Int = 0
        
        
        init(name : String, gender : Bool) {
            self.name = name
            self.gender = gender
        }
    
    }
    