//
//  ViewController.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import UIKit
import SpriteKit



class ViewController: UIViewController {
    
    var currentGame : GameModel = GameModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var spriteView:SKView = self.view as! SKView
        spriteView.showsDrawCount = true
        spriteView.showsNodeCount = true
        spriteView.showsFPS = true
        
    }

    @IBOutlet weak var consoleOutput: UITextView!
    @IBOutlet weak var consoleField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var rateField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var periodField: UITextField!
    

    @IBAction func sendInput(sender: AnyObject) {
        var input = consoleField.text
        consoleField.text = ""
        
        if input == "newoffer"{
            consoleOutput.text = currentGame.directInput(input)
        }else{
            consoleOutput.text = currentGame.directInput(input)
            
            
        }
    }

    @IBAction func sendNegotiation(sender: AnyObject) {
        var amount = amountField.text.toInt()
        var rate = (rateField.text as NSString).floatValue
        var duration = durationField.text.toInt()
        var period = periodField.text.toInt()
        let offer = (amount!, rate, duration!, period!)
        var portfolio : Portfolio
        portfolio = currentGame.handleNegotiation(offer)
        showOffer(portfolio.latestOffer, status : portfolio.currentStatus)

    }
    
    override func viewWillAppear(animated: Bool) {
        var gameScene:GameScene = GameScene(size: CGSizeMake(768, 1024))
        gameScene.gameViewController = self
        gameScene.currentGame = currentGame
        var spriteView:SKView = self.view as! SKView
        spriteView.presentScene(gameScene)
    }
    
    
    func showOffer(offer : (Int, Float, Int, Int), status : NegStatus){
        if status == .Negotiated{
            consoleOutput.text = "-Loan Negotiated- \nAmount: \(offer.0)\nRate: \(offer.1)\nDuration: \(offer.2)\nPeriod: \(offer.3)"
        }else if status == .Accepted{
            consoleOutput.text = "-Loan Accepted Congratulations- \nAmount: \(offer.0)\nRate: \(offer.1)\nDuration: \(offer.2)\nPeriod: \(offer.3)\nPlease enter your next command:"
            
        }else if status == .Rejected{
                consoleOutput.text = "-Offer Rejected-"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}





