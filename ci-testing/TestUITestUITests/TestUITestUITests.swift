//
//  TestUITestUITests.swift
//  TestUITestUITests
//
//  Created by Max Ainatchi on 6/12/17.
//  Copyright © 2017 Max Ainatchi, Inc. All rights reserved.
//

import XCTest
import Foundation

class TestUITestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIncrease() {
        let app = UITest.getApp()
        let button = UITest.Element(name: "Increase Count Button", getElement: { app.getElement().buttons.element(withId: "Increase Count") })
        let label = UITest.Element(name: "Count Label", getElement: { app.getElement().otherElements.element(withId: "Count") })
        let labelText = UITest.Element.Attribute(element: label, attribute: "label", getValue: { label.getElement().label })
        
        // Initial State
        UITest.when(app, is: .initialized, labelText, should: .equal, "You tapped me 0 times!")
        
        // After 1 tap
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me 1 time!")
        
        // After 2 taps
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me 2 times!")
        
        // After 3 taps
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me 3 times!")
    }
    
    func testDecrease() {
        let app = UITest.getApp()
        let button = UITest.Element(name: "Decrease Count Button", getElement: { app.getElement().buttons.element(withId: "Decrease Count") })
        let label = UITest.Element(name: "Count Label", getElement: { app.getElement().otherElements.element(withId: "Count") })
        let labelText = UITest.Element.Attribute(element: label, attribute: "label", getValue: { label.getElement().label })
        
        // Initial State
        UITest.when(app, is: .initialized, labelText, should: .equal, "You tapped me 0 times!")
        
        // After 1 tap
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me -1 times!")
        
        // After 2 taps
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me -2 times!")
        
        // After 3 taps
        UITest.when(button, is: .tapped, labelText, should: .equal, "You tapped me -3 times!")
    }
}
