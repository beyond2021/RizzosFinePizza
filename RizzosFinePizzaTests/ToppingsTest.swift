//
//  ToppingsTest.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/18/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza
class ToppingsTest: XCTestCase {
    
    let toppingPrice = 2.00

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldSetTitle(){
        let topping = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        
        let item = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00, topping : topping)
        
        XCTAssertEqual(item.topping, topping,
                       "Initializer should set the item title")
        
        
    }

  func testInit_ShouldSetTitleAndDescription(){
    let topping = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
    
    let item = FoodItem(title: "Test title", itemDescription : "Test description", originalPrice : 12.00, topping : topping)
    
    XCTAssertEqual(item.topping, topping,
                   "Initializer should set the item title")
    
    
    }
    func testWhenToppingTitleDifferes_ShouldBeNotEqual() {
        
        let firstTopping = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        let secondTopping = Topping(name: "Salami", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
    XCTAssertNotEqual(firstTopping, secondTopping)
    
    }
    
    func testWhenToppingDescriptionDifferes_ShouldBeNotEqual() {
        
        let firstTopping = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        let secondTopping = Topping(name: "Extra Cheese", toppingDescription: "Melted chese", toppingPrice : toppingPrice)
        XCTAssertNotEqual(firstTopping, secondTopping)
        
    }
    
    func testInit_ShouldSetToppingTitleDescriptionAndPrice(){
        _ = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        
        
    }
    
    func testWhenToppingPriceDifferes_ShouldBeNotEqual(){
        let firstTopping = Topping(name: "Extra Cheese", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        let secondTopping = Topping(name: "Extra Cheese", toppingDescription: "Melted chese", toppingPrice : 0.00)
        XCTAssertNotEqual(firstTopping, secondTopping)
        
    }
    
    
}
