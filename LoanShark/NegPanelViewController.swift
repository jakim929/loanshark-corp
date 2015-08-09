//
//  NegPanelViewController.swift
//  LoanShark
//
//  Created by James Kim on 8/7/15.
//
//

import UIKit

class NegPanelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var rateField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var periodField: UITextField!
    
    
    @IBAction func sendNegotiation(sender: AnyObject) {
        var amount = amountField.text.toInt()
        var rate = (rateField.text as NSString).floatValue
        var duration = durationField.text.toInt()
        var period = periodField.text.toInt()

    }
 /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var amount = amountField.text.toInt()
        var rate = (rateField.text as NSString).floatValue
        var duration = durationField.text.toInt()
        var period = periodField.text.toInt()
        let viewController: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("primaryViewController")
        
        

        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}*/
}