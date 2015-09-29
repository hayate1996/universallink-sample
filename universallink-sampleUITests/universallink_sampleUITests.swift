//
//  universallink_sampleUITests.swift
//  universallink-sampleUITests
//
//  Created by NAGAMINE HIROMASA on 2015/09/16.
//  Copyright © 2015年 Hiromasa Nagamine. All rights reserved.
//

import XCTest

class universallink_sampleUITests: XCTestCase {
        
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
    
    func testExample() {
        
        let app = XCUIApplication()
        let httpButton = app.buttons["HTTP"]
        httpButton.tap()
        
        let backButton = app.navigationBars["universallink_sample.WebView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton.tap()
        
        let httpsButton = app.buttons["HTTPS"]
        httpsButton.tap()
        backButton.tap()
        app.buttons["UIWebView"].tap()
        app.buttons["WebKit"].tap()
        httpButton.tap()
        
        let backButton2 = app.navigationBars["universallink_sample.WebKitView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton2.tap()
        httpsButton.tap()
        backButton2.tap()
        app.buttons["Safari"].tap()
        httpButton.tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        httpsButton.tap()
        doneButton.tap()
    }

    func testSearch() {
        
        let app = XCUIApplication()
        app.buttons["HTTP"].tap()
        
        let universallinkSampleWebviewNavigationBar = app.navigationBars["universallink_sample.WebView"]
        universallinkSampleWebviewNavigationBar.tap()
        
        let httpsButton = app.buttons["HTTPS"]
        universallinkSampleWebviewNavigationBar.childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.buttons["Safari"].tap()
        httpsButton.tap()
        app.typeText("google")
        app.buttons["Done"].tap()
        app.buttons["WebKit"].tap()

    }
    
}
