//
//  ViewController.swift
//  GoDutch
//
//  Created by Chris Argonish on 6/27/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var gratuityAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fadeIfNull()
        let font = UIFont(name: "SalesforceSans-Regular", size: 10)
        tipControl.setTitleTextAttributes([NSFontAttributeName: font!], forState: UIControlState.Normal)
        billField.keyboardAppearance = UIKeyboardAppearance.Dark
        billField.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    let name = "Chris"
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        fadeIfNull()
        billField.clearButtonMode = .WhileEditing
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func fadeIfNull() {
        if billField.text == "" {
            self.tipControl.alpha = 0
            self.tipLabel.alpha = 0
            self.totalLabel.alpha = 0
            self.gratuityAmountLabel.alpha = 0
            self.totalAmountLabel.alpha = 0
        } else {
            UIView.animateWithDuration(0.4, animations: {
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.gratuityAmountLabel.alpha = 1
            self.totalAmountLabel.alpha = 1
            })
        }
    }
}

