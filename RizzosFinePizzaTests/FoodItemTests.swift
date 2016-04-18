//
//  FoodItemTests.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/14/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class FoodItemTests: XCTestCase {
    let largeRound = 12.00

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testInit_ShouldSetTitleDescriptionWithOriginalPrice(){
        let item = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00)
        XCTAssertEqual(item.title, "Test title",
                       "Initializer should set the item title")
        XCTAssertEqual(item.itemDescription, "Test description",
                       "Initializer should set the item Description")
        XCTAssertEqual(item.originalPrice, largeRound,
                       "Initializer should set the item Description")
        
        
    }
    // Test to drive Equatable Conformance
    /*
     The implementation of the equivalence operator is strange because it doesn't check
     any properties of the items that are passed in. But following the rules of TDD, it is
     good enough. Let's move on to more complicated tests:
 
 */
    
    func testEqualItems_ShouldBeEqual() {
        let firstItem = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00)
        let secondItem = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00)
        XCTAssertEqual(firstItem, secondItem)
    }
        
    

   }
