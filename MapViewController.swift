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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Journal Entry")
        
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
        
        mapView.addAnnotations(JournalEntryController.sharedInstance.currentEntries)

        mapView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        mapView.addAnnotations(JournalEntryController.sharedInstance.currentEntries)
        tableView.reloadData()
    }
    
    func addButtonClicked() {
        
        let addEntryController = AddEntryViewController(nibName: "AddEntryViewController", bundle: nil)
        self.presentViewController(addEntryController, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalEntryController.sharedInstance.currentEntries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Journal Entry", forIndexPath: indexPath) as! TableViewCell
        
        let entry = JournalEntryController.sharedInstance.currentEntries[indexPath.row]
        
        cell.entryTitle.text = "\(entry.title!)"
        cell.entryDate.text = "\(entry.date!)"
        cell.entryPhoto.image = entry.photo
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            JournalEntryController.sharedInstance.currentEntries.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let chosenJournalEntry = JournalEntryController.sharedInstance.currentEntries[indexPath.row]
        
        let newCenter = chosenJournalEntry.coordinate
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        
        let region = MKCoordinateRegionMake(newCenter, span)
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.setCenterCoordinate(newCenter, animated: true)
        
        
    }

    /*func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
     
        let identifier = "Journal Entry"
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView!.canShowCallout = true
            
            let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            leftLabel.textColor = UIColor.blueColor()
            leftLabel.backgroundColor = UIColor.whiteColor()
            
            annotationView!.leftCalloutAccessoryView = leftLabel
            
            mapView.addAnnotation(annotation)
            
        }
 
        let label = annotationView!.leftCalloutAccessoryView as! UILabel
        label.text = annotation.title!
        return annotationView
        
    }*/
    
}
