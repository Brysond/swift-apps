//
//  TamagotchiStats.swift
//  Tamagotchi_App
//
//  Created by Bryson, David (IRG) on 14/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

struct TamagotchiStats {
    private var age = 0
    private var happy = 0
    private var hunger = 0
    private var weight = 5
    private var discipline = 0
    
    func getAge() -> Int {
        return age
    }
    func getHappiness() -> Int {
        return happy
    }
    func getHunger() -> Int {
        return hunger
    }
    func getWeight() -> Int {
        return weight
    }
    func getDiscipline() -> Int {
        return discipline
    }
    
    func displayStats() -> String {
        return """
            Age: \(age)
            Hapy: \(happy)
            Hunger: \(hunger)
            Mass: \(weight)
            Discipline: \(discipline)
            """
    }
}
