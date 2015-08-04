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
    
    
    func newPlayer(){
        
    }
    
    func startGame(){
        while true{
            
           
        }
    }
    
    func processCommand(command : String) -> String{
        
        if command == "test"{
            return "The command processing is working!"

        }else{
            return "No such command exists"
        }
        
    }
    
    func query(instruction : String) -> String{
        
    }
    
}






