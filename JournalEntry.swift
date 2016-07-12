//
//  MapView.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/10/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import MapKit

class JournalEntry: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    var notes: String = ""
    var date: NSDate? = nil
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.coordinate = coordinate
        
        
    }
    
}
