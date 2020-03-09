//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 30/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStartData()
        
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
        cell.accessoryType = divisions[indexPath.row].getAbsence(for: currentDate) == nil ? . none : .checkmark
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
        
        var absence = Absence(date: currentDate)
        if let existingAbsence = selectedDivision.getAbsence(for:currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence view controller from Storyboard")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            if let absence = division.getAbsence(for: self.currentDate) {
                absence.present = division.students
            } else {
                let absence = Absence(date: self.currentDate, present:division.students)
                division.absences.append(absence)
            }
            tableView.reloadData()
            completionHandler(true)
        }
        allPresent.backgroundColor = UIColor.green
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        guard let encoded =  try? encoder.encode(divisions) else {
            print("Unable to encode divisions into json")
            return nil
        }
        guard let json = String(data: encoded, encoding: .utf8) else {
            print("Unable to turn encoded divisions into a string")
            return nil
        }
        return json
    }
    
    func convertJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            return nil
        }
        return decoded
    }
    
    func loadStartData() {
        divisions.append(DivisionFactory.createDivision(code: "Division 1", of:5))
        divisions.append(DivisionFactory.createDivision(code: "Division 2", of:8))
    }


}

