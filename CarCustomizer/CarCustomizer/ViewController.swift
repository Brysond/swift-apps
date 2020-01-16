//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Bryson, David (IRG) on 12/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var carStatistics: UILabel!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var remainingFundsDisplay: UILabel!
    @IBOutlet var remainingTimeDisplay: UILabel!
    
    var timeRemaining = 30
    var remainingFunds = 999 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            disableUnaffordablePackages()
        }
    }
    var starterCars = StarterCars()
    var nextCar = 0
    
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[nextCar]
        resetDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        remainingTimeDisplay.text = "\(timeRemaining)"
    }
    
    func resetDisplay() {
        remainingFunds = 999
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
    }
    
    func disableUnaffordablePackages() {
        engineAndExhaustPackage.isEnabled = shouldBeEnabled(engineAndExhaustPackage)
        tiresPackage.isEnabled = shouldBeEnabled(tiresPackage)
        
    }
    
    func shouldBeEnabled(_ control: UISwitch) -> Bool {
        if control.isOn {
            return true
        } else {
            if remainingFunds >= 999 {
                return true
            } else {
                return false
            }
        }
    }
    
    @IBAction func nextCar(_ sender: Any) {
        if timeRemaining > 0 {
        nextCar += 1
        if nextCar >= starterCars.cars.count {
            nextCar = 0
        }
        car = starterCars.cars[nextCar]
        resetDisplay()
        }
    }
    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            remainingTimeDisplay.text = "\(timeRemaining)"
        } else {
            timer?.invalidate()
            tiresPackage.isEnabled = false
            engineAndExhaustPackage.isEnabled = false
            
            
        }
    }

}

