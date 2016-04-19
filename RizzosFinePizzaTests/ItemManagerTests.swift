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
     //   XCTAssertEqual(item, returnedItem, "should be the same item")
        
        
        XCTAssertEqual(item.itemDescription, returnedItem.itemDescription,
                       "should be the same itemDescription")
        XCTAssertEqual(item.originalPrice, returnedItem.originalPrice,
                       "should be the same originalPrice")
        
       sut.removeAllItemsFromCart()
        XCTAssertEqual(sut.itemsAddedToCartCount, 0,
                       "Initially toDo count should be 0")
        
    }
    
    func testGetPrices_GetAllPrices(){
        
        let firstItem = FoodItem(title: "item 1",itemDescription: "Description 2", originalPrice: 10.50)
        sut.addItemPriceToList(firstItem.originalPrice)
        let secondItem = FoodItem(title:"item 2",itemDescription: "Description 2", originalPrice: 20.50)
        sut.addItemPriceToList(secondItem.originalPrice)
        let thirdItem = FoodItem(title:"item 3",itemDescription: "Description 2", originalPrice: 30.50)
        sut.addItemPriceToList(thirdItem.originalPrice)
        let fourthItem = FoodItem(title:"item 4",itemDescription: "Description 4", originalPrice: 40.50)
        sut.addItemPriceToList(fourthItem.originalPrice)
        let fifthItem = FoodItem(title:"item 5",itemDescription: "Description 5", originalPrice: 50.50)
        sut.addItemPriceToList(fifthItem.originalPrice)
        let sixthItem = FoodItem(title:"item 6",itemDescription: "Description 6", originalPrice: 60.50)
        sut.addItemPriceToList(sixthItem.originalPrice)
        
        XCTAssertEqual(sut.priceValue, 0.00,
                       "Initially toDo count should be 0")
        XCTAssertEqual(sut.pricelistItemCount, 6,
                       "Initially toDo count should be six")
        
        
    }

    func testPriceTotal_AddAllPrices(){
        let firstItem = FoodItem(title: "item 1",itemDescription: "Description 2", originalPrice: 10.50)
        sut.addItemPriceToList(firstItem.originalPrice)
        let secondItem = FoodItem(title:"item 2",itemDescription: "Description 2", originalPrice: 20.50)
        sut.addItemPriceToList(secondItem.originalPrice)
        let thirdItem = FoodItem(title:"item 3",itemDescription: "Description 2", originalPrice: 30.50)
        sut.addItemPriceToList(thirdItem.originalPrice)
        let fourthItem = FoodItem(title:"item 4",itemDescription: "Description 4", originalPrice: 40.50)
        sut.addItemPriceToList(fourthItem.originalPrice)
        let fifthItem = FoodItem(title:"item 5",itemDescription: "Description 5", originalPrice: 50.50)
        sut.addItemPriceToList(fifthItem.originalPrice)
        let sixthItem = FoodItem(title:"item 6",itemDescription: "Description 6", originalPrice: 60.50)
        sut.addItemPriceToList(sixthItem.originalPrice)

        
    }
    func testRemoveAllItems_ShouldResultInCountsBeZero() {
        
        let topping = Topping(name: "Extra Cheese", toppingDescription: "Extra Cheese", toppingPrice: 2.0)
        sut.addItem(FoodItem(title: "Large Round Pizza", itemDescription: "Large Round Pizza", originalPrice: 12.00))
        sut.addItem(FoodItem(title: "Calzone", itemDescription: "Spicy", originalPrice: 19.00, topping: topping))
            
            sut.checkItemAtIndex(0)
            XCTAssertEqual(sut.itemsAddedToCartCount, 2,
                "itemsAddedToCartCount should be 2")
            XCTAssertEqual(sut.itemsAddedToCartCount, 2,
                "itemsAddedToCartCount should be 2")
       
        
        
            sut.removeAllItemsFromCart()
         XCTAssertEqual(sut.itemsAddedToCartCount, 0, "toDoCount should be 0")        
    }
    
    
    
   
}
