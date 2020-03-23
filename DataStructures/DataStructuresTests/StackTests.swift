//
//  StackTests.swift
//  DataStructuresTests
//
//  Created by Bryson, David (IRG) on 27/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import XCTest

class StackTests: XCTestCase {
    let stack = Stack()
    func testThatThisWorks() {
        let actual = stack.top
        XCTAssertEqual(actual,-1)
    }
}
