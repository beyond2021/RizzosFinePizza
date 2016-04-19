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
    let toppingPrice = 2.00
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
        
        let order =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 223456789, orderNumber : 123457 )
        
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
        
        _ =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        //        FoodOrder.allItems += oneItem
        
    }
    
    
    
    
    
    func testInit_ShouldAddOneItemTheOrder(){
        let item =  FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00)
        FoodOrder.addItemToTheOrder(item)
        
        
    }
    
    func testInit_ShouldSetFoodOrderWithTimeStampFoodItemDeliverLocationAndDeliverTypeDelivery(){
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        _ =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        
   
    }
    
    
    func testWhenLocationDifferes_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Delivery
        let firstItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Home"), deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        let secondItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Office"), deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        XCTAssertNotEqual(firstItem, secondItem)
    }
 
    
    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Pickup
        var firstItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Home"), deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        var secondItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Office"), deliveryType : deliveryType ,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        XCTAssertNotEqual(firstItem, secondItem)
        
        firstItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Home"), deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        
        secondItem = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:nil, deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)

        
    }
    
    func testWhenTimestampDifferes_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Pickup
        let firstOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 1.0, deliveryLocation:Location(name: "Home"), deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457 )
        let secondOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:Location(name: "Office"), deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 223456789, orderNumber : 123457 )
        XCTAssertNotEqual(firstOrder, secondOrder)
    }
    
    func testInit_ShouldSetFoodOrderWithTimeStampFoodItemAndCustomerFirstName(){
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        
        let order =  FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget" , customerPhoneNumber : 223456789, orderNumber : 123457)
        
        XCTAssertEqual(order.item.title, "Large Round Pizza",
                       "Initializer should set the item title")
        XCTAssertEqual(order.item.itemDescription,
                       "Delicious Lagre round")
        XCTAssertEqual(order.item.originalPrice, largeRound,
                       "Initializer should set the item Original price")
        XCTAssertEqual(order.timeStamp, 0.0,
                       "Initializer should set the item order time")
        XCTAssertEqual(order.customerFirstName, "Bridget",
                       "Initializer should set the item Original price")

        
        
    }
    func testWhenCustomerNameDifferes_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        
        let firstOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 223456789, orderNumber : 123457 )
        let secondOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Sharon" , customerPhoneNumber : 223456789, orderNumber : 123457)
        
        XCTAssertNotEqual(firstOrder, secondOrder)
    }
    func testWhenPhoneNumberDifferes_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        
        let firstOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 123456789, orderNumber : 123457 )
        let secondOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Sharon", customerPhoneNumber : 223456789, orderNumber : 123457 )
        
        XCTAssertNotEqual(firstOrder, secondOrder)
      
    }
    
    func testWhenOrderNumberDifferes_ShouldBeNotEqual() {
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
        
        
        let firstOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 123456789, orderNumber : 123456 )
        let secondOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Sharon", customerPhoneNumber : 223456789, orderNumber : 123457 )
        
        XCTAssertNotEqual(firstOrder, secondOrder)
        
    }
    
    func testAddExtraToOrder_ShouldReturnExtraWithOrder(){
        let deliveryType = DeliveryType.Delivery
        let location = Location(name: "Test name")
         let topping = Topping(name: "Test Topping", toppingDescription: "Lucious chese", toppingPrice : toppingPrice)
        
        
        
        let firstOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00, topping: topping), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Bridget", customerPhoneNumber : 123456789, orderNumber : 123456 )
        let secondOrder = FoodOrder(item:FoodItem(title: "Large Round Pizza", itemDescription : "Delicious Lagre round", originalPrice : 12.00), timeStamp : 0.0, deliveryLocation:location, deliveryType : deliveryType,customerFirstName : "Sharon", customerPhoneNumber : 223456789, orderNumber : 123457 )
        
        XCTAssertNotEqual(firstOrder, secondOrder)
       

        
        
    }
    
        

}
