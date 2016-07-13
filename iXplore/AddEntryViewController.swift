//
//  AddEntryViewController.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/11/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import MapKit

class AddEntryViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var notesField: UITextField!
    
    @IBOutlet weak var latitudeField: UITextField!
    
    @IBOutlet weak var longitudeField: UITextField!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last!
        latitudeField.text = String(location.coordinate.latitude)
        longitudeField.text = String(location.coordinate.longitude)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func saveNewEntry(sender: UIButton) {
        
        if (titleField.text! == "" || latitudeField.text! == "" || longitudeField.text! == "") {
            let errorAlert = UIAlertController(title: "Go Back", message: "Required fields have not been filled.", preferredStyle:UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            errorAlert.addAction(alertAction)
            
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
            
            let newJournalEntry = JournalEntry(title: titleField.text!, coordinate: CLLocationCoordinate2D(latitude: Double(latitudeField.text!)!, longitude:  Double(longitudeField.text!)!))
    
            newJournalEntry.date = NSDate()
            newJournalEntry.notes = notesField.text!
            var entryList = JournalEntryController.sharedInstance.getEntries()
            
            entryList += [newJournalEntry]
            
            let manager = NSFileManager.defaultManager()
            let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
            let fileURL = documents.URLByAppendingPathComponent("journalEntries.txt")

            NSKeyedArchiver.archiveRootObject(entryList, toFile: fileURL.path!)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
  
    
}
