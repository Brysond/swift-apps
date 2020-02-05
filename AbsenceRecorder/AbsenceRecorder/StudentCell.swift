//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 05/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.accessoryType = selected ? .checkmark : .none
        
    }

}
