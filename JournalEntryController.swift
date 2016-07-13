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
    var currentEntries = [JournalEntry]()
    
    private init(){
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent("journalEntries.txt")
        if let entries = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as? [JournalEntry] {
            currentEntries = entries
        }
     
    }
    func getEntries() ->[JournalEntry]{
        
        var currentEntries = [JournalEntry]()
        
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent("journalEntries.txt")
        if let entries = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as? [JournalEntry] {
            currentEntries = entries
        }
        
        return currentEntries
    }
    

}

