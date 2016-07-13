//
//  MapViewController.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/8/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var journalEntryList: [JournalEntry] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        journalEntryList = JournalEntryController.sharedInstance.getEntries()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addButtonClicked))
        
        self.navigationItem.title = "iXplore"
        self.navigationItem.rightBarButtonItem = addButton
        
        let location = CLLocationCoordinate2D(latitude: -34.0, longitude: 18.5)
        
        let span = MKCoordinateSpanMake(0.3, 0.3)
        
        let region = MKCoordinateRegionMake(location, span)
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.setCenterCoordinate(location, animated: true)
        
        mapView.zoomEnabled = true
        mapView.scrollEnabled = true
        
        mapView.addAnnotations(journalEntryList)

        mapView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        journalEntryList = JournalEntryController.sharedInstance.getEntries()
        
        mapView.addAnnotations(journalEntryList)
        tableView.reloadData()
        
    }
    
    func addButtonClicked() {
        
        let addEntryController = AddEntryViewController(nibName: "AddEntryViewController", bundle: nil)
        self.presentViewController(addEntryController, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let journalEntries = journalEntryList
        
        return journalEntries.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Journal Entry")
        
        let journalEntries = journalEntryList
        
        cell.textLabel?.text = String("\(journalEntries[indexPath.row].title!)")
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var journalEntries = journalEntryList
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            journalEntries.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var journalEntries = journalEntryList
        
        let chosenJournalEntry = journalEntries[indexPath.row]
        
        let newCenter = chosenJournalEntry.coordinate
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        
        let region = MKCoordinateRegionMake(newCenter, span)
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.setCenterCoordinate(newCenter, animated: true)
        
        
    }

    /*func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
     
        let identifier = "Journal Entry"
        
        let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
        if annotationView == nil {
            
            annotationView!.canShowCallout = true
            
            let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            leftLabel.textColor = UIColor.blackColor()
            leftLabel.backgroundColor = UIColor.blueColor()
            
            annotationView!.leftCalloutAccessoryView = leftLabel
            
        }
 
        let label = annotationView!.leftCalloutAccessoryView as! UILabel
        label.text = annotation.title!
        return annotationView
        
    }*/


}
