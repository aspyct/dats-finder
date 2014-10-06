//
//  DisclaimerViewController.swift
//  DATS Finder
//
//  Created by Antoine d'Otreppe on 06/10/14.
//  Copyright (c) 2014 Aspyct.org. All rights reserved.
//

import UIKit

class DisclaimerViewController : UIViewController {
    @IBOutlet weak var understandButton: UIButton!
    
    override func viewDidLoad() {
        understandButton.layer.borderColor = UIColor.blueColor().CGColor
        understandButton.layer.borderWidth = 2
        understandButton.layer.cornerRadius = 5
    }
    
    @IBAction func doUnderstand(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "understood")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
