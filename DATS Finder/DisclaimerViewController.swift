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
    @IBOutlet weak var disclaimerText: UITextView!
    
    override func viewDidLoad() {
        let blueColor = UIColor(red: 30.0/255, green: 182.0/255, blue: 225.0/255, alpha: 1)
        understandButton.setTitleColor(blueColor, forState: UIControlState.Normal)
        understandButton.layer.borderColor = blueColor.CGColor
        understandButton.layer.borderWidth = 2
        understandButton.layer.cornerRadius = 5
        
        self.disclaimerText.text = NSLocalizedString("disclaimer", comment:"Some comment");
    }
    
    @IBAction func doUnderstand(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "understood")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
