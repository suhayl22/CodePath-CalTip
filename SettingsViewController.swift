//
//  SettingsViewController.swift
//  CalTip
//
//  Created by Suhayl SH on 08/03/17.
//  Copyright © 2017 Suhayl SH. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{

    @IBOutlet weak var settingsSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaultValues = UserDefaults.standard
        let segmentChecked = defaultValues.integer(forKey: "SegmentHighlighted")
        self.settingsSegmentedControl.selectedSegmentIndex = segmentChecked

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let tipCentages = [0.17, 0.20, 0.22, 0.25]
    
    

    @IBAction func selectTip(_ sender: AnyObject) {
        
        let defaults = UserDefaults.standard
        defaults.set(settingsSegmentedControl.selectedSegmentIndex, forKey: "SegmentHighlighted")
        defaults.synchronize()
    
    }
}
