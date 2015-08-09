//
//  Game.swift
//  LoanShark
//
//  Created by Abdulrahman Jamjoom on 8/4/15.
//
//

import Foundation

class Game : NSObject {
    
    var player : Player
    
    var receivingCommand : Bool = true
    var currentCommand : String = ""
    var currentInput : String = ""
    var defaultPrompt : String = "Please enter a command"
    var inputCount : Int = 0
    var inputExpected : Int = 0
    var inputArray : [String] = [String]()
    var negotiationFinished : Bool = false
    
    override init() {
        player = Player()
    }
    
    func newPlayer(name : String){
        player.changeName(name)
    }

    func directInput(input : String) -> String{
        if receivingCommand == true{
            currentCommand = input
            return processInput()
        }else{
            currentInput = input
            return processInput()
        }
    }
    
    func processNegotiation(negotiation : (Int,Float,Int,Int)){
        
    }
    
    func acceptNegotiation() -> Loan{
        return player.acceptOffer()
    }
    
    func processCommand(command : String)->String{
        var returnValue = ""
        if command == "create"{
            player.changeName(self.inputArray[0])
            player.changeGender(toBool(self.inputArray[1])!)
            returnValue = "Your character has been created with the name of \(player.name) and gender \(convertGender(player.gender))"
            
            
        }else if command == "james"{
            player.changeName("James Kim")
            player.changeGender(true)
            player.changeBalance(1000000)
            returnValue = "Your character has been created with the name of James and gender of male. Full Options available"
            
            
        }else if command == "client"{
            return createRandomClient()
            
        }else if command == "newoffer"{
            var portfolio = createPortfolio(player.currentClient.proposeLoan())
            return "-Loan Proposed-\n" + convertOffer(portfolio.latestOffer)
        
        }else if command == ""{
            returnValue = "Please enter a command"
        }
        
        if returnValue == "" {
            returnValue = "No such command exists"
        }
        receivingCommand = true
        inputCount = 0
        inputExpected = 0
        return returnValue
    }
    
    func processInput()->String{
        if currentCommand == "create"{
            prepareForInput(2)
            if inputCount == 0{
                interateInput()
                return "Please type in your name: \(inputCount)"
            }else if inputCount == 1{
                interateInput()
                return "Please type in your gender: \(inputCount)"
            }else if inputCount == 2{
                interateInput()
                return processCommand(currentCommand)
            }
        }else{
            receivingCommand = true
            return processCommand(currentCommand)
            
        }
        return "current Command \(currentCommand) 1"
    }
    
    func interateInput(){
        if self.inputCount == 0 {
            inputCount++
        }else if inputCount <= inputExpected{
            self.inputArray.append(currentInput)
            inputCount++
        }
    }
    
    func prepareForInput(inputExpected : Int){
        if inputCount == 0 {
            self.inputExpected = inputExpected
            self.receivingCommand = false
            self.inputCount = 0
            inputArray.removeAll()
        }
        
    }
    
    func handleNegotiation(incomingInput : (Int, Float, Int, Int)) -> Portfolio{
    
        return player.negotiateOffer(incomingInput)
        
        
    }
    
    func createRandomClient()->String{
        player.clientList.append(Client(name: Random.returnRandomName(), creditRating: Random.simpleRandom(1 , max: 4), netWorth: Random.simpleRandomScaled(1000, max: 1000000, scale: 1000)))
        return player.currentClient.clientDescription
    }
    
    func createPortfolio(loan : Loan)->Portfolio{
        player.addPortfolio(Portfolio(client: player.currentClient, loan: loan))
        return player.currentPortfolio
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

    
    
}






