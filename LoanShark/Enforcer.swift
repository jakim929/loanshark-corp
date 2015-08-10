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
    var strength : Int = 0
    var invisibility : Int = 0
    var price : Int = 0
    var numberOfRaids : Int = 0
    
    
    init(name : String, gender : Bool) {
        self.name = name
        self.gender = gender
    }
   
    //Getters
    
    func getName() -> String{
        return self.name
    }
    func getGender() -> Bool{
        return self.gender
    }
    func getStrength() -> Int{
        return self.strength
    }
    func getInvisibility() -> Int{
        return self.invisibility
    }
    func getPrice() -> Int{
        return self.price
    }
    func getNumberOfRaids() -> Int{
        return self.numberOfRaids
    }
    func updateRaids(numberOfRaids : Int){
        self.numberOfRaids = numberOfRaids - 1
    }
}



