//
//  ViewController.swift
//  Secure Notes
//
//  Created by Alejandro Padron on 4/2/16.
//  Copyright © 2016 Alejandro Padron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateForLabel()
        
        
    }
    //Mark: Helper Methods
    func setDateForLabel() -> Void{
        // Get current calender from device
        // Based on any time zone
        // set the date for the DateLabel
        let date  = NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .LongStyle
        formatter.timeStyle = .ShortStyle
        formatter.AMSymbol = "AM"
        formatter.PMSymbol = "PM"
        
        
        let dateTimeString = formatter.stringFromDate(date)
        
        dateLabel.text = dateTimeString
    }
    
    //MARK: Actions
    @IBAction func onDone(sender: UIBarButtonItem) {
        
        
    }
    
    
}

