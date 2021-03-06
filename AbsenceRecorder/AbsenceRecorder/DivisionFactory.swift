//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 03/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code:code)
        
        let surnames = ["Jones", "Gray", "Davis","Brown", "Cole", "Walker", "Baldwin", "Johnson"]
        for i in 1...size {
            let student = Student(forename:"Bingo\(i)", surname: surnames[i-1], birthday: Date.init())
            division.students.append(student)
        }
        return division
    }
}
