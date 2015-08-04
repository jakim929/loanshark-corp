//
//  Game.swift
//  LoanShark
//
//  Created by Abdulrahman Jamjoom on 8/4/15.
//
//

import Foundation

class Game : NSObject {
    
    func newPlayer(){
        var player = Player()
        player.name =
        player.gender =
        player.respectability = 1
        player.thugness = 1
        player.balance = 1000
        player.loanLedger = 0
        player.openLoans = 0
        
    }
    
        func startGame(){
            
            while true{
                
                func processCommand(command : String) -> String{
                    
                    if command == "test"{
                        return "The command processing is working!"
                    }else{
                        return "No such command exists"
                    }
                    
                }
            }
        }
        
}






