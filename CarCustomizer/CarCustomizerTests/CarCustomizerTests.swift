//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Bryson, David (IRG) on 12/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {
    func testThatCarOutputsCorrectValues() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125km/h
        Acceleration: 7.7
        Handling: 5
        """
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }

}
