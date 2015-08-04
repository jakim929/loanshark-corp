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
        var player = Player(name: "James", true)
        
    }

    @IBOutlet weak var consoleOutput: UILabel!
    
    @IBOutlet weak var consoleField: UITextField!

    @IBAction func sendCommand(sender: AnyObject) {
        var command = consoleField.text
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

