//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 05/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class Absence {
    var takenOn : Date
    var present: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
}
