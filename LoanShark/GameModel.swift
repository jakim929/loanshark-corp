//
//  GameModel.swift
//  LoanShark
//
//  Created by James Kim on 8/11/15.
//
//

import Foundation

class GameModel : NSObject {
    
    var player : Player
    
    var receivingCommand : Bool = true
    var currentCommand : String = ""
    var currentInput : String = ""
    var defaultPrompt : String = "Please enter a command"
    var inputCount : Int = 0
    var inputExpected : Int = 0
    var inputArray : [String] = [String]()
    //var clientsInScene : [Client] = [Client]() //Only one client at a time for now
    var clientInScene : Client?
    
    
    override init() {
        player = Player()
        super.init()
        loadGameData()
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
            return createRandomClient().clientDescription
            
        }else if command == "newoffer"{
            var portfolio = createPortfolio(player.currentClient.proposeLoan())
            return "-Loan Proposed-\n" + convertOffer(portfolio.latestOffer)
        }else if command == "save"{
            saveGameData()
            returnValue = "Game saved"
            
        }else if command == "load"{
            loadGameData()
            returnValue = "Game loaded"
            
        }else if command == "info"{
            
            returnValue = "\(player.name)\n\(player.balance)\n\nClients:\n"
            for client in player.clientList{
                returnValue = returnValue + client.getName() + "\n"
            }
            
            
        }else if command == "currentclient"{
            returnValue = player.currentClient.getName()
        }else if command == "clienttotal"{
            returnValue = String(player.clientList.count)
            
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
    
    func createRandomClient()->Client{
        player.clientList.append(Client(name: Random.returnRandomName(), creditRating: Random.simpleRandom(1 , max: 4), netWorth: Random.simpleRandomScaled(1000, max: 1000000, scale: 1000)))
        return player.currentClient
    }
    
    func createPortfolio(loan : Loan)->Portfolio{
        player.addPortfolio(Portfolio(client: player.currentClient, loan: loan))
        return player.currentPortfolio
    }
    
    func enterClient()->Client{
        let client = createRandomClient()
        clientInScene = client
        return clientInScene!
    }
    
    func exitClient(){
        clientInScene = nil
    }
 /* //Blocked out since we'll only deal with one client at a time right now
    func enterClient()->Client{
        let client = createRandomClient()
        clientsInScene.append(client)
        return client
    }
    
    func enterClient(enteringClient : Client)->Client{
        clientsInScene.append(enteringClient)
        return clientsInScene[clientsInScene.count-1]
    }

    func exitClient(exitingClient : Client)->Bool{
        if contains(clientsInScene, exitingClient){
            clientsInScene = clientsInScene.filter( {$0 != exitingClient})
            return true
        }else{
            return false
        }
    }
*/
    func saveGameData() {
        var path = documentFilePath(fileName: "Gamedata.plist")
        
        var clientList = NSMutableArray()
        for client : Client in player.clientList {
            clientList.addObject(client.data())
        }
        
        var playerData = player.data()
        
        var objects = [playerData, clientList]
        var keys = ["playerData", "clientList"]
        
        var gameData = NSDictionary(objects: objects, forKeys: keys)
        gameData.writeToFile(path, atomically: true)
    }
    
    func loadGameData(){
        
        var path = documentFilePath(fileName: "Gamedata.plist")
        var gameData : NSDictionary? = NSDictionary(contentsOfFile: path)
        // Load gamedata template from mainBundle if no saveFile exists
        if gameData == nil {
            var mainBundle = NSBundle.mainBundle()
            path = mainBundle.pathForResource("Gamedata", ofType: "plist")!
            gameData = NSDictionary(contentsOfFile: path)
        }
        
        var playerData = gameData!["playerData"] as! [String : AnyObject]
        
        var playerName = playerData["name"] as! String
        var playerGender = playerData["gender"] as! Bool
        var playerRespectability = playerData["respectability"] as! Int
        var playerThugness = playerData["thugness"] as! Int
        var playerBalance = playerData["balance"] as! Int
        
        player.setPlayer(playerName, gender: playerGender, respectability: playerRespectability, thugness: playerThugness, balance: playerBalance)
        
        var clientListData = gameData!["clientList"] as! [[String : AnyObject]]
        
        for clientData in clientListData {
            var clientNumber = clientData["clientNumber"] as AnyObject? as! Int
            var name = clientData["name"] as AnyObject? as! String
            var creditRating = clientData["creditRating"] as AnyObject? as! Int
            var netWorth = clientData["netWorth"] as AnyObject? as! Int
            var pastExperience = clientData["pastExperience"] as AnyObject? as! Int
            var anxietyRating = clientData["anxietyRating"] as AnyObject? as! Int
            
            var loanListData = clientData["loanList"] as! [[String : AnyObject]]
            
            var loanList = [Loan]()
            
            for loanData in loanListData {
                var loanNumber = loanData["loanNumber"] as AnyObject? as! Int
                var loanStatus = Status(rawValue: loanData["loanStatus"] as AnyObject? as! Int)
                var loanAmount = loanData["loanAmount"] as AnyObject? as! Int
                var interestRate = loanData["interestRate"] as AnyObject? as! Float
                var loanDuration = loanData["loanDuration"] as AnyObject? as! Int
                var compoundPeriod = loanData["compoundPeriod"] as AnyObject? as! Int
                var currentRepaid = loanData["currentRepaid"] as AnyObject? as! Int
                var startTime = loanData["startTime"] as AnyObject? as! CFAbsoluteTime
                
                var loan = Loan(loanNumber: loanNumber, loanStatus: loanStatus!, loanAmount: loanAmount, interestRate: interestRate, loanDuration: loanDuration, compoundPeriod: compoundPeriod, currentRepaid: currentRepaid, startTime: startTime)
                loanList.append(loan)
                player.loanLedger.append(loan)
            }
            var client = Client(clientNumber: clientNumber, name: name, creditRating: creditRating, netWorth: netWorth, pastExperience: pastExperience, anxietyRating: anxietyRating, loanList: loanList)
            player.clientList.append(client)
        }
        
    }
    
    
    func documentFilePath(#fileName: String) -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var documentsDirectory = paths[0] as! String
        var path = documentsDirectory.stringByAppendingPathComponent(fileName)
        return path
    }
    
    
    
    
    
}






