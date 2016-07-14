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
    var date: String = ""
    var photo: UIImage?
    
    var ID: NSUUID
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.coordinate = coordinate
        self.ID = NSUUID()
        
        
    }
    
    required init?(coder: NSCoder) {
        
        title = (coder.decodeObjectForKey("title") as? String) ?? ""
        notes = (coder.decodeObjectForKey("notes") as? String) ?? ""
        
        let latitude = (coder.decodeObjectForKey("latitude") as? Double) ?? 0.0
        let longitude = (coder.decodeObjectForKey("longitude") as? Double) ?? 0.0
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        date = (coder.decodeObjectForKey("date") as? String) ?? ""
        
        photo = (coder.decodeObjectForKey("photo") as? UIImage)
        
        ID = (coder.decodeObjectForKey("ID") as? NSUUID) ?? NSUUID()
       
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(title, forKey: "title")
        
        let lat = Double(coordinate.latitude)
        let long = Double(coordinate.longitude)
        
        aCoder.encodeObject(lat, forKey: "latitude")
        aCoder.encodeObject(long, forKey: "longitude")
        aCoder.encodeObject(notes, forKey: "notes")
        aCoder.encodeObject(date, forKey: "date")
        aCoder.encodeObject(photo, forKey: "photo")
        aCoder.encodeObject(ID, forKey: "ID")
        
    }
    
}
