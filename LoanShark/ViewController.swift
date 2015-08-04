//
//  ViewController.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import UIKit

class ViewController: UIViewController {

    var james = Player(name: "James", gender: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        consoleOutput.text = "The game has started and you have created a character named James, and he is of the gender male."
        
        
    }


    @IBOutlet weak var consoleOutput: UITextView!
    @IBOutlet weak var consoleField: UITextField!

    @IBAction func sendCommand(sender: AnyObject) {
        var command = consoleField.text
        consoleOutput.text = james.processCommand(command)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

