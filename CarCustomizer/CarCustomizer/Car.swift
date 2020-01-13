//
//  Car.swift
//  CarCustomizer
//
//  Created by Bryson, David (IRG) on 12/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)km/h
            Acceleration: \(acceleration)
            Handling: \(handling)
            """
    }
    
    
}
