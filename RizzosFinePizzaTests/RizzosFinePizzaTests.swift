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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldTakeTitle() {
        foodItem(title : "Food TitlE")
    }
    
}
