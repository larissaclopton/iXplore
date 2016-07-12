//
//  AddEntryViewController.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/11/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import MapKit

class AddEntryViewController: UIViewController {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var notesField: UITextField!
    
    @IBOutlet weak var latitudeField: UITextField!
    
    @IBOutlet weak var longitudeField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAddEntry(sender: UIButton) {
        
        let confirmationAlert = UIAlertController(title: "Cancel", message: "Are you sure you want to cancel?", preferredStyle:UIAlertControllerStyle.Alert)
        
        let alertActionOne = UIAlertAction(title: "Yes", style: .Cancel, handler: {action in self.dismissViewControllerAnimated(true, completion: nil)})
        
        let alertActionTwo = UIAlertAction(title: "No", style: .Default, handler: nil)
        
        confirmationAlert.addAction(alertActionOne)
        confirmationAlert.addAction(alertActionTwo)

        self.presentViewController(confirmationAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func saveNewEntry(sender: UIButton) {
        
        if (titleField.text! == "" || latitudeField.text! == "" || longitudeField.text! == "") {
            let errorAlert = UIAlertController(title: "Go Back", message: "Required fields have not been filled.", preferredStyle:UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            errorAlert.addAction(alertAction)
            
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
            var newJournalEntry = JournalEntry(title: titleField.text!, coordinate: CLLocationCoordinate2D(latitude: Double(latitudeField.text!)!, longitude:  Double(longitudeField.text!)!))
        
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
            let year =  components.year
            let month = components.month
            let day = components.day
        
            newJournalEntry.date = date
            newJournalEntry.notes = notesField.text!
            
            JournalEntryController.sharedInstance.addNewEntry(newJournalEntry)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    

}
