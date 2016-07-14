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
        
        do {
            let journalEntries = try manager.contentsOfDirectoryAtURL(documents, includingPropertiesForKeys: nil, options: [])
            for file in journalEntries {
                if let entry = NSKeyedUnarchiver.unarchiveObjectWithFile(file.path!) as? JournalEntry {
                    currentEntries.append(entry)
                }
            }
        
        }
        catch {
            // do nothing
        }
    }

}

