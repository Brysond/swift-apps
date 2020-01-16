//
//  Tamagotchi.swift
//  Tamagotchi_App
//
//  Created by Bryson, David (IRG) on 16/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var age = 0
    var happy = 0
    var hunger = 0
    var weight = 5
    var discipline = 0
    
    func getOlder() {
        age += 1
    }
    
    func getHappier() {
        happy += 1
    }
    
    func getSadder() {
        happy -= 1
    }
    
    func getHungrier() {
        hunger += 1
    }
    
    func getLessHungry() {
        hunger -= 1
    }
    
    func getFatter() {
        weight += 1
    }
    
    func getLighter() {
        weight -= 1
    }
    
    func statsOutput() -> String {
        
        return """
            Age: \(age)
            Happiness: \(happy)
            Hunger: \(hunger)
            Weight: \(weight)
            Discipline: \(discipline)
            """
        
    }
}
