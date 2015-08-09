//
//  Random.swift
//  LoanShark
//
//  Created by James Kim on 8/6/15.
//
//

import Foundation


extension Float {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self) as String
    }
}

public class Random {
    
    static func simpleRandom(min : Int, max : Int)->Int{
        if max > min{
            return Int(arc4random_uniform(UInt32(max))) + min
        }
        return 0
    }
    
    static func simpleRandomScaled(min : Int, max : Int, scale : Int)->Int{
        var returnValue : Int
        if max > scale{
            if min % scale == 0{
                returnValue = self.simpleRandom(min/scale, max : max/scale) * scale
            }else{
                returnValue = self.simpleRandom((min/scale) + 1, max : max/scale) * scale
            }
        }else{
            returnValue = 0
        }
        return returnValue
    }
    
    static func simpleRandomFloat(min : Float, max : Float)->Float{
        return Float(arc4random()) / Float(UINT32_MAX) * (max - min) + min
    }
    
    static func returnRandomName()->String{
        let randomNames : [String] = ["Lauri Brouwer", "Stephanie Fogle", "Young Boshears", "Julius Pellegren", "Sam Vanhook", "Caryl Tenny", "Delicia Gibb", "Barbara Karner", "Krystle Banta", "Sharell Davids", "Kristie Mcgrady"]
        let randomIndex = Int(arc4random_uniform(UInt32(randomNames.count)))
        return randomNames[randomIndex]
    }
}
    

