//
//  TableViewCell.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/13/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var entryPhoto: UIImageView!
    
    @IBOutlet weak var entryTitle: UILabel!
    
    @IBOutlet weak var entryDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
