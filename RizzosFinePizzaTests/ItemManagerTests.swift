//
//  ItemManagerTests.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    let largeRoundPizza = "largeRoundPizza"
    let largeRoundPizzaDescription = "Mozzarella, Grated Cheese and Sauce. Add toppings to your pie for $2.00 each."
    let largeRoundPizzaOriginalPrice = 12.00
        
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testitemsInOrderCount_Initially_ShouldNotBeZero() {
        
        XCTAssertEqual(sut.itemsAddedToCartCount, 0,
                       "Initially toDo count should be 0")
        
    }
    
    func testMenuCount_AfterAddingAllItems_IsOne() {
        sut.addItem(FoodItem(title:largeRoundPizza,itemDescription: largeRoundPizzaDescription, originalPrice: largeRoundPizzaOriginalPrice))
        XCTAssertEqual(sut.itemsAddedToCartCount, 1, "toDoCount should be 1")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = FoodItem(title:largeRoundPizza,itemDescription: largeRoundPizzaDescription, originalPrice: largeRoundPizzaOriginalPrice)
        sut.addItem(item)
        let returnedItem = sut.checkItemAtIndex(0)
        
        XCTAssertEqual(item.title, returnedItem.title,
                       "should be the same item")
        XCTAssertEqual(item.itemDescription, returnedItem.itemDescription,
                       "should be the same itemDescription")
        XCTAssertEqual(item.originalPrice, returnedItem.originalPrice,
                       "should be the same originalPrice")
        
        
    }
    
    func testSelectedMenuItemItem_ChangesCountOfToDoAndOfDoneItems() {
        sut.addItem(FoodItem(title: "First item", itemDescription: "First item description ", originalPrice: 0.0))
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.checkItemAtIndex(0).title, "First item")
        XCTAssertEqual(sut.checkItemAtIndex(0).itemDescription, "First item description ")
        XCTAssertEqual(sut.checkItemAtIndex(0).originalPrice, 0.0)
        
    }
    
    
    func testCheckingItem_RemovesItFromTheOrderList() {
        let firstItem = FoodItem(title:"First item",itemDescription: "First Description", originalPrice: 0.50)
        let secondItem = FoodItem(title:"Second item",itemDescription: "Second Description", originalPrice: 0.75)
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.checkItemAtIndex(0).title, firstItem.title, "should be the same item")
        XCTAssertEqual(sut.checkItemAtIndex(0).itemDescription, firstItem.itemDescription,"should be the same itemDescription")
        XCTAssertEqual(sut.checkItemAtIndex(0).originalPrice, firstItem.originalPrice, "should be the same originalPrice")
        
        
        
    }

    
    // Test for items added to cart
    func testDoneItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = FoodItem(title:"item",itemDescription: "Description", originalPrice: 0.50)
        sut.addItem(item)
        sut.checkItemAtIndex(0)
        let returnedItem = sut.itemAddedToCartAtIndex(0)
        XCTAssertEqual(item.title, returnedItem.title,
                       "should be the same item")
        XCTAssertEqual(item.itemDescription, returnedItem.itemDescription,
                       "should be the same itemDescription")
        XCTAssertEqual(item.originalPrice, returnedItem.originalPrice,
                       "should be the same originalPrice")
        
        
    }
    
    func testDoneEmptyCart_ShoulRemoveAllItems(){
        
        let item = FoodItem(title:"item",itemDescription: "Description", originalPrice: 0.50)
        sut.addItem(item)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.itemAddedToCartAtIndex(0)
        XCTAssertEqual(item.title, returnedItem.title,
                       "should be the same item")
        XCTAssertEqual(item.itemDescription, returnedItem.itemDescription,
                       "should be the same itemDescription")
        XCTAssertEqual(item.originalPrice, returnedItem.originalPrice,
                       "should be the same originalPrice")
        
       sut.removeAllItemsFromCart()
        XCTAssertEqual(sut.itemsAddedToCartCount, 0,
                       "Initially toDo count should be 0")
        
    }
    
    
   
}