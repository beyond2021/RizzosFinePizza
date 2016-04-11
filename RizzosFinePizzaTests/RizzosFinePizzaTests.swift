//
//  RizzosFinePizzaTests.swift
//  RizzosFinePizzaTests
//
//  Created by KEEVIN MITCHELL on 4/2/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class RizzosFinePizzaTests: XCTestCase {
    let largeRound = 12.00
    
    
    override func setUp() {
        super.setUp()
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
    
    
    
    
   }
