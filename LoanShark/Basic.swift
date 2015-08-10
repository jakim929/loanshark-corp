//
//  Basic
//  LoanShark
//
//  Created by James Kim on 8/10/15.
//
//

import Foundation
//Status label for loans
    enum Status {
        case Created
        case Ongoing
        case Paid
        case Defaulted
        case Rejected
    }

enum NegStatus {
    case Negotiated
    case Accepted
    case Rejected
}

    func convertGender(gender : Bool)->String{
        if gender == true{
            return "Male"
        }else{
            return "Female"
        }
            
    }
        
    func convertOffer(offer : (Int, Float, Int, Int))->String{
        return "Amount: \(offer.0)\nRate: \(offer.1)\nDuration: \(offer.2)\nPeriod: \(offer.3)"
    }

func compareOffer(offer1 : (Int, Float, Int, Int), offer2 : (Int, Float, Int, Int))->Bool{
    var returnBool = false
    if (offer1.0 == offer2.0 && offer1.1 == offer2.1 && offer1.2 == offer2.2 && offer1.3 == offer2.3){
        returnBool = true
    }
    return returnBool
    
}

func returnTotalPayment(amount : Int, rate : Float, duration : Int, period : Int) -> Int{
    return Int(Float(amount)*(powf(1.0 + rate, Float(duration)/Float(period))))
    
}

func toBool(line : String) -> Bool? {
    switch line {
    case "True", "true", "yes", "1", "male", "man", "Male", "Man":
        return true
    case "False", "false", "no", "0", "female", "woman", "Female", "Woman":
        return false
    default:
        return nil
    }
}


//Regarding Random Functions

func simpleRandom(min : Int, max : Int)->Int{
    if max > min{
        return Int(arc4random_uniform(UInt32(max))) + min
    }
    return 0
}

func simpleRandomScaled(min : Int, max : Int, scale : Int)->Int{
    var returnValue : Int
    if max > scale{
        if min % scale == 0{
            returnValue = simpleRandom(min/scale, max/scale) * scale
        }else{
            returnValue = simpleRandom((min/scale) + 1, max/scale) * scale
        }
    }else{
        returnValue = 0
    }
    return returnValue
}

func simpleRandomFloat(min : Float, max : Float)->Float{
    return Float(arc4random()) / Float(UINT32_MAX) * (max - min) + min
}

func returnRandomName()->String{
    let randomNames : [String] = ["Lauri Brouwer", "Stephanie Fogle", "Young Boshears", "Julius Pellegren", "Sam Vanhook", "Caryl Tenny", "Delicia Gibb", "Barbara Karner", "Krystle Banta", "Sharell Davids", "Kristie Mcgrady"]
    let randomIndex = Int(arc4random_uniform(UInt32(randomNames.count)))
    return randomNames[randomIndex]
}
