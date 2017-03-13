//
//  ViewController.swift
//  CalTip
//
//  Created by Suhayl SH on 14/02/17.
//  Copyright © 2017 Suhayl SH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var etBillAmount: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var threePersonsI: UILabel!
    @IBOutlet weak var twoPersonsI: UILabel!
    @IBOutlet weak var onePerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Read the stored valuess
        let defaults = UserDefaults.standard
        let segmentHighlightedd = defaults.integer(forKey: "SegmentHighlighted")
        self.tipControl.selectedSegmentIndex = segmentHighlightedd
        calculateTip(self)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipCentages = [0.17, 0.20, 0.22, 0.25]
        let billAmount = Double(etBillAmount.text!) ?? 0
        let tipAmount = billAmount * tipCentages[tipControl.selectedSegmentIndex]
        let totalAmount = billAmount + tipAmount
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        onePerson.text = String(format: "$%.2f", totalAmount)
        twoPersonsI.text = String(format: "$%.2f", totalAmount/2)
        threePersonsI.text = String(format: "$%.2f", totalAmount/3)
    }
 
}

