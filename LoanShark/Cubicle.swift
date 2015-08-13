//
//  Cubicle.swift
//  LoanShark
//
//  Created by James Kim on 8/12/15.
//
//

import Foundation

class Cubicle{
    var portfolio : Portfolio?
    var client : Client?
    var loan : Loan?
    var employee : Employee?
    var loanActive : Bool = false
    var furnishing : CubicleClass = .Basic
    
    var closed : Bool {
        if self.employee == nil{
            return true
        }else{
            return false
        }
    }
    
    func assignEmployee(employee : Employee)->Employee?{
        if self.employee == nil{
            self.employee = employee
            return nil //returns nil if there wasn't a employee in there before
        }else{
            let exitingEmployee = self.employee
            self.employee = employee
            return exitingEmployee //returns the employee that was in there before and is now deassigned
        }
        
    }
    
    func deassignEmployee() -> Employee?{
        if self.employee == nil{
            return nil //returns nil if there was no employee in there
        }else{
            let currentEmployee = self.employee
            self.employee = nil
            return currentEmployee //returns the employee that was in there and is now deassigned
        }

    }
    
    func enterClient(client : Client) -> Client?{
        if self.client == nil {
            self.client = client
            return self.client! //returns the client that just entered (only allowed when there's no client in there from before)

        }else{
            return nil //returns nil and doesn't change the client if there's already a client in there
        }
    }
    func exitClient() -> Client? {
        if let currentClient = self.client{
            self.client = nil
            return currentClient //returns the current client who exited.
        }
        return nil //returns nil if there is no client in there.
    }
    
    func explainToClient(){
        if let currentClient = self.client{
            currentClient.eagerness++
        }
    }
}