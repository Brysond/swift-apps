//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Bryson, David (IRG) on 21/11/2019.
//  Copyright © 2019 David Bryson. All rights reserved.
//

import Foundation

class Tamagotchi {
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
}
