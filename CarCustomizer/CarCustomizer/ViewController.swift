//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Bryson, David (IRG) on 12/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carStatistics: UILabel!
    
    var starterCars = StarterCars()
    var nextCar = 0
    
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[nextCar]
        
    }
    @IBAction func nextCar(_ sender: Any) {
        if nextCar >= starterCars.cars.count {
            nextCar = 0
        }
        car = starterCars.cars[nextCar]
        nextCar += 1
    }

}

