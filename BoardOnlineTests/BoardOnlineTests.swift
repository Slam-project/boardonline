//
//  BoardOnlineTests.swift
//  BoardOnlineTests
//
//  Created by Alexandre on 17/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit
import XCTest
import BoardOnline

class BoardOnlineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateCV()
    {
        let cv = CV(id: 1, nom: "test", prenom: "création", titre: "cv", lastFormation: "ios", experience: "epsi")
        XCTAssertNotNil(cv)
        
    }
    
    func testAddExperienceToCV() {
        let cv: CV = CV(id: 1, nom: "Lepretre", prenom: "Alexandre", titre: "Dev", lastFormation: "Epsi", experience: "Wid'op")
        let exp = Experience(id: 1, periode: "2 mois", client: "moi", poste: "dev", mission: "ios");
        cv.addExperience(exp)
        XCTAssert(cv.getExperience(0) === exp)
    }
}
