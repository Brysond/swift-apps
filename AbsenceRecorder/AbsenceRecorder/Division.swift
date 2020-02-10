//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 30/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class Division {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func hasAbsence(for date: Date) -> Bool {
        for absence in absences {
            if absence.takenOn == date {
                return true
            }
        }
        return false
    }
    func getAbsence(for date: Date) -> Absence? {
        for absence in absences {
            if absence.takenOn == date {
                return absence
            }
        }
        return nil
    }
}
