//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Bryson, David (IRG) on 21/11/2019.
//  Copyright © 2019 David Bryson. All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    let tamagotchi = Tamagotchi()
    
    func testInitialisedValuesAreCorrect() {
        let testCases = [(input:tamagotchi.getAge(),expected:0),
                         (input:tamagotchi.getHunger(),expected:0)]
        for testCase in testCases {
            XCTAssertEqual(testCase.input,testCase.expected)
        }
    }

    func testTamagotchiHungerGoesDownWhenFed() {
        
    }
}

