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
    
    
    func processCommand(command : String)->String{
        var returnValue = ""
        if command == "create"{
            player.changeName(self.inputArray[0])
            player.changeGender(toBool(self.inputArray[1])!)
            returnValue = "Your character has been created with the name of \(player.name) and gender \(player.gender)"
        }
        if command == "james"{
            returnValue = "James is awesome"
        
        }
        if returnValue == ""{
            returnValue = "No such command exists"
        }
        self.currentCommand = "gaa"
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
            
        }else{
            receivingCommand = true
            inputCount = 0
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

    


    

    
    
}






