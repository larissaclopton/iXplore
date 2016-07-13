//
//  MapView.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/10/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import MapKit

class JournalEntry: NSObject, MKAnnotation, NSCoding {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    var notes: String = ""
    var date: NSDate? = nil
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.coordinate = coordinate
        
        
    }
    
    required init?(coder: NSCoder) {
        
        title = (coder.decodeObjectForKey("title") as? String) ?? ""
        notes = (coder.decodeObjectForKey("notes") as? String) ?? ""
        
       // coordinate = CLLocationCoordinate2D()
        let latitude = (coder.decodeObjectForKey("latitude") as? Double) ?? 0.0
        let longitude = (coder.decodeObjectForKey("longitude") as? Double) ?? 0.0
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       // coordinate.latitude = (coder.decodeObjectForKey("latitude") as? Double) ?? 0.0
        //coordinate.longitude = (coder.decodeObjectForKey("longitude") as? Double) ?? 0.0
        
        date = (coder.decodeObjectForKey("date") as? NSDate)!
       
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(title, forKey: "title")
        
        let lat = Double(coordinate.latitude)
        let long = Double(coordinate.longitude)
        
        aCoder.encodeObject(lat, forKey: "latitude")
        aCoder.encodeObject(long, forKey: "longitude")
        aCoder.encodeObject(notes, forKey: "notes")
        aCoder.encodeObject(date, forKey: "date")
        
        
    }
    
}
