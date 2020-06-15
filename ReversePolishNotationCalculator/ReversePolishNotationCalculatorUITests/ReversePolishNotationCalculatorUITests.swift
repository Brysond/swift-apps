//
//  ReversePolishNotationCalculatorUITests.swift
//  ReversePolishNotationCalculatorUITests
//
//  Created by Bryson, David (IRG) on 10/06/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import XCTest

class ReversePolishNotationCalculatorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSimpleAdditionReturnsCorrectValue() {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["8"].tap()
        
        let enterButton = app.buttons["Enter"]
        enterButton.tap()
        app.buttons["5"].tap()
        enterButton.tap()
        app.buttons["+"].tap()
        app.buttons["Eval"].tap()
        XCTAssert(app.staticTexts["13"].exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSimpleSubtractionReturnsCorrectValue() {
        
        let app = XCUIApplication()
        app.launch()
        let twoButton = app/*@START_MENU_TOKEN@*/.buttons["Two"]/*[[".buttons[\"2\"]",".buttons[\"Two\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        twoButton.tap()
        app.buttons["Enter"].tap()
        twoButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Minus"]/*[[".buttons[\"-\"]",".buttons[\"Minus\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Eval"].tap()
        XCTAssert(app.staticTexts["0"].exists)
    }
    
    func testThatDivisionBy0ReturnsErrorMessage() {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.buttons["Two"]/*[[".buttons[\"2\"]",".buttons[\"Two\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Enter"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Zero"]/*[[".buttons[\"0\"]",".buttons[\"Zero\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Divide"]/*[[".buttons[\"\/\"]",".buttons[\"Divide\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.alerts["Problem in calculation"].exists)
    }
    
    func testThatDivisionWithRemainderReturnsErrorMessage() {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Seven"].tap()
        app.buttons["+/-"].tap()
        app.buttons["Enter"].tap()
        app.buttons["Three"].tap()
        app.buttons["Divide"].tap()
        XCTAssert(app.alerts["Problem in calculation"].exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
