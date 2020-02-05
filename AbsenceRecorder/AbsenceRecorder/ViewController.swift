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
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStartData()
        for division in divisions {
            print("Code: \(division.code), No.: \(division.students.count)")
            for student in division.students {
                print("\(student.forename)")
            }
        }
        
        updateDateDisplay()
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewControllerTableViewController else {
            fatalError("Failed to load Division Absence view controller from Storyboard")
        }
        
        let selectedDivision = divisions[indexPath.row]
        let newAbsence = Absence(date: currentDate)
        newAbsence.absent.append(contentsOf: selectedDivision.students)
        selectedDivision.absences.append(newAbsence)
        vc.absence = newAbsence
        vc.division = selectedDivision
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func loadStartData() {
        divisions.append(DivisionFactory.createDivision(code: "Division 1", of:1))
        divisions.append(DivisionFactory.createDivision(code: "Division 2", of:2))
    }


}

