//
//  UITest.swift
//  TestUITest
//
//  Created by Max Ainatchi on 6/13/17.
//  Copyright © 2017 Max Ainatchi, Inc. All rights reserved.
//

import Foundation
import XCTest

class UITest {
    class Element {
        var name: String
        var getElement: () -> XCUIElement
        
        init(name: String, getElement: @escaping () -> XCUIElement) {
            self.name = name
            self.getElement = getElement
            self.should(.exist)
        }
        
        func should(_ be: UITest.State) {
            let message = "\(self.name) should \(be.rawValue)"
            let test: Bool
            switch be {
            case .exist:
                test = self.getElement().exists
            }
            UITest.assert(test, message)
        }
        
        struct Attribute<T> { var element: Element, attribute: String, getValue: () -> T }
    }
    
    enum Action: String {
        case tapped = "tapped"
        case initialized = "initialized"
    }
    
    enum Operation: String {
        case equal = "equal"
    }
    
    enum State: String {
        case exist = "exist"
    }
    
    class func getApp() -> Element {
        return Element(name: "app", getElement: { XCUIApplication() as XCUIElement })
    }
    
    class func when<T: Equatable>(_ object: Element, is action: Action, _ result: Element.Attribute<T>, should be: Operation, _ value: T) {
        // Perform action
        switch action {
        case .tapped:
            object.getElement().tap()
        default: ()
        }
        
        // No need to make the query twice
        let resultValue = result.getValue()
        
        // Set the test case
        let test: Bool
        switch be {
        case .equal:
            test = resultValue == value
        }
        
        // Construct the message
        var message = "When \(object.name) is \(action.rawValue), expected \(result.element.name) \(result.attribute) to \(be.rawValue) '\(value)'"
        if !test { message += ", but instead was '\(resultValue)'" }
        
        // Assert
        assert(test, message)
    }
    
    class func when(_ object: Element, is action: Action, _ value: Element, should be: State) {
        let message = "When \(object.name) is \(action.rawValue), \(value.name) should \(be.rawValue)"
        let test: Bool
        switch be {
        case .exist:
            test = value.getElement().exists
        }
        assert(test, message)
    }
    
    private class func assert(_ test: Bool, _ message: String) {
        print(message)
        XCTAssert(test, message)
    }
}

extension XCUIElementQuery {
    func element(withId id: String) -> XCUIElement {
        return self.element(matching: .any, identifier: id)
    }
}

extension XCUIElement {
    var allElements: XCUIElementQuery {
        return self.descendants(matching: .any)
    }
}
