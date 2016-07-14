//
//  UIDateField.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/14/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit

class UIDateField: UITextField {

    var datePickerView = UIDatePicker()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.inputView = datePickerView
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.addTarget(self, action: #selector(dateSelected), forControlEvents: .ValueChanged)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.inputView = datePickerView
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.addTarget(self, action: #selector(dateSelected), forControlEvents: .ValueChanged)
        
    }

    func dateSelected() {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let stringDate = formatter.stringFromDate(datePickerView.date)
        
        self.text = stringDate
        
    }
    
}
