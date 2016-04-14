//
//  MenuTests.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/12/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class MenuTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testInit_ShouldGetAllTheItemsInRizzosMenu(){
        let item = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00)
        
        
      _ =  FullMenu(allItems: [item])
    }

    

}
