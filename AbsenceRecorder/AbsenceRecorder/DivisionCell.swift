//
//  DivisionCell.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 13/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class DivisionCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.accessoryType = selected ? .checkmark : .none
        
    }
}
