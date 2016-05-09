//
//  MuziklenTests.swift
//  MuziklenTests
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import XCTest
@testable import Muziklen

class MListViewControllerTests: XCTestCase {
    
    var listView: MListViewController?
    var dataProvider: ArtistsListDataProvider?
    var artistList: [Artist]?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        listView = MListViewController()
        dataProvider = ArtistsListDataProvider()
        
        artistList = [
            Artist(name: "Muse", tags: [], info: "", followersCount: 1, albums: []),
            Artist(name: "Queen", tags: [], info: "", followersCount: 1, albums: []),
            Artist(name: "Nirvana", tags: [], info: "", followersCount: 1, albums: []),
            Artist(name: "Placebo", tags: [], info: "", followersCount: 1, albums: []),
            Artist(name: "Radiohead", tags: [], info: "", followersCount: 1, albums: []),
            Artist(name: "Talking Heads", tags: [], info: "", followersCount: 1, albums: [])
        ]
        
        dataProvider?.addArtists(artistList!)
    
        listView?.dataProvider = dataProvider
        
        // UIApplication.sharedApplication().keyWindow?.rootViewController = listView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItemCount() {
        let expectedItemCount = artistList!.count
        let sutItemCount = listView?.tableView.numberOfRowsInSection(0)
        
        XCTAssertTrue(expectedItemCount == sutItemCount)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
