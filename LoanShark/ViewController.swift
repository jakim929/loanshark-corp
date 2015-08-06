//
//  ViewController.swift
//  LoanShark
//
//  Created by James Kim on 7/31/15.
//
//

import UIKit

class ViewController: UIViewController {
    
    var currentGame : Game = Game()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBOutlet weak var consoleOutput: UITextView!
    @IBOutlet weak var consoleField: UITextField!

    @IBAction func sendInput(sender: AnyObject) {
        var input = consoleField.text
        consoleOutput.text = currentGame.directInput(input)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

