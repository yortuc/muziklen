//
//  MuziklenUITests.swift
//  MuziklenUITests
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import XCTest

class MuziklenUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testConfigureCell(){
        
        //let sutItemIndex = 1
        //let artistCell = listView?.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: sutItemIndex, inSection: 0)) as? MArtistsTableViewCell
        
        // check artist name
        //let cellArtistName = artistCell?.lblName.text
        
        //XCTAssertTrue(cellArtistName == artistList?[sutItemIndex].name)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
