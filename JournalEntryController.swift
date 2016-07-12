//
//  JournalEntryController.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/10/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import MapKit
import UIKit

class JournalEntryController {
    
    static var sharedInstance = JournalEntryController()
    
    var journalEntryList: [JournalEntry] = {
        
        let journalEntryOne = JournalEntry(title: "Workshop 17", coordinate: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983))
        journalEntryOne.notes = "Where we take class"
        journalEntryOne.date = NSDate()
        
        
        let journalEntryTwo = JournalEntry(title: "Truth Coffee", coordinate: CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045))
        journalEntryTwo.notes = "The best coffee in Cape Town"
        journalEntryTwo.date = NSDate()
        
        let journalEntryThree = JournalEntry(title: "Chop Chop Coffee", coordinate: CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055))
        journalEntryThree.notes = "Need to try this place"
        journalEntryThree.date = NSDate()
        
        let journalEntryFour = JournalEntry(title: "Two Oceans Aquarium", coordinate: CLLocationCoordinate2D(latitude: -33.907374,longitude: 18.417536))
        journalEntryFour.notes = "Aquarium right next to class"
        journalEntryFour.date = NSDate()
        
        let journalEntryFive = JournalEntry(title: "Market On the Wharf", coordinate: CLLocationCoordinate2D(latitude: -33.910673,longitude: 18.418776))
        journalEntryFive.notes = "Where we eat lunch during the week"
        journalEntryFive.date = NSDate()
        
        
        return [journalEntryOne,journalEntryTwo,journalEntryThree,journalEntryFour,journalEntryFive]
        
    }()
    
    
    func addNewEntry(entry: JournalEntry) {
     
        journalEntryList += [entry]
     
     }
    

}

