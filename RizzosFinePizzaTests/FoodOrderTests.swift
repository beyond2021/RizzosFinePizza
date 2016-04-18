//
//  FoodOrderTests.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/14/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class FoodOrderTests: XCTestCase {
    let largeRound = 12.00

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetFoodOrderWithTimeStampAndFoodItem(){
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        let order =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType)
        
        XCTAssertEqual(order.item.title, "Large Round Pizza",
                       "Initializer should set the item title")
        XCTAssertEqual(order.item.itemDescription,
                       "Delicious Lagre round")
        XCTAssertEqual(order.item.originalPrice, largeRound,
                       "Initializer should set the item Original price")
        XCTAssertEqual(order.timeStamp, 0.0,
                       "Initializer should set the item order time")
        
    }
    
    
    func testInit_ShouldCreateOneOrder(){
        
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        _ =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType)
        //        FoodOrder.allItems += oneItem
        
    }
    
    
    
    
    
    func testInit_ShouldAddOneItemTheOrder(){
        let item =  FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00)
        FoodOrder.addItemToTheOrder(item)
        
        
    }
    
    func testInit_ShouldSetFoodOrderWithTimeStampFoodItemDeliverLocationAndDeliverTypeDelivery(){
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        _ =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType)
        
   
    }
    
    
    
    
        
      
    

}
