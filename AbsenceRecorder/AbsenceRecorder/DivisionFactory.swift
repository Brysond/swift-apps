//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 03/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class DivisionFactory {
    static func creatDivision(code: String, of size: Int) -> Division {
        let division = Division(code:code)
        
        for i in 1...size {
            let student = Student(forename:"Bingo\(i)", surname: "Twice\(i)", birthday: Date.init())
            division.students.append(student)
        }
        return division
    }
}
