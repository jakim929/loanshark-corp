//
//  ViewController.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentGame : Game
        
        consoleOutput.text = "The game has started and you have created a character named James, and he is of the gender male."
        
        
    }


    @IBOutlet weak var consoleOutput: UITextView!
    @IBOutlet weak var consoleField: UITextField!

    @IBAction func sendCommand(sender: AnyObject) {
        var command = consoleField.text
        consoleOutput.text = currentGame.processCommand(command)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

