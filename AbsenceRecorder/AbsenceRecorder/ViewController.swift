//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 30/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var divisions: [Division] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStartData()
        for division in divisions {
            print("Code: \(division.code), No.: \(division.students.count)")
            for student in division.students {
                print("\(student.forename)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func loadStartData() {
        divisions.append(DivisionFactory.createDivision(code: "Division 1", of:1))
        divisions.append(DivisionFactory.createDivision(code: "Division 2", of:2))
    }


}

