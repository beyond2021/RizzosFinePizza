//
//  MenuListDataSupplierTest.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/19/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class MenuListDataSupplierTest: XCTestCase {
    var controller: MenuItemsListViewController!
    var sut : MenuListDataSupplier!
    var tableView: UITableView!
    
    override func setUp() {
          sut = MenuListDataSupplier()
        sut.itemManager = ItemManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewControllerWithIdentifier("MenuItemsListViewController") as! MenuItemsListViewController
            _ = controller.view
            tableView = controller.tableView
            tableView.dataSource = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfSections_IsNine() {
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 9)
    }
    
    /*
    func testNumberRowsInFirstSection_IsPizzaCount() {
       
        
       
        sut.itemManager?.addItem(FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95))
        
        
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal)", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large)", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 19.95
))
        
        sut.itemManager?.addItem(FoodItem(title: "Quattro Formaggi Pizza (Personal)", itemDescription: "Ricotta, mozzarella, romano, fresh garlic, herbs, parmigiano aioli. No tomato sauce.", originalPrice: 21.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Verduri Pizza (Large)", itemDescription: "Roasted pepper, bell pepper, black and green olive, plum tomato, marinated mushroom, spinach, fresh garlic, red onion, oregano, mozzarella. No tomato sauce.", originalPrice: 23.95))
 
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal)", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 6)
    
    }
 */
    
    func testNumberRowsInSecondSection_IsPizzaCount() {
        
        
        sut.itemManager?.addItem(FoodItem(title: "House Salad", itemDescription: "We start with the simple salad then add bell pepper, sweet red onion and black olive.", originalPrice: 9.95))
                sut.itemManager?.addItem(FoodItem(title: "Caesar Salad", itemDescription: "Homemade croutons, creamy dressing and our own blend of grated cheeses.", originalPrice: 9.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Special Salad", itemDescription: "Baby spinach, marinated mushroom, roasted pepper, fresh mozzarella and herbed vinaigrette.", originalPrice: 9.95))
         XCTAssertEqual(tableView.numberOfRowsInSection(1), 3)
    }
    
    func testNumberRowsInThirdSection_IsGarlicKnotsCount() {
        
        
        sut.itemManager?.addItem(FoodItem(title: "Garlic Knots (5 pcs)", itemDescription: "Extra fluffy knots, tossed with fresh garlic, chopped parsley, a blend of grated cheeses and a touch of extra virgin olive oil.", originalPrice: 2.00))
        XCTAssertEqual(tableView.numberOfRowsInSection(2), 1)

        
    }
    
    func testNumberRowsInFourthSection_IsCalzonesCount() {
        
        sut.itemManager?.addItem(FoodItem(title: "Calzoni", itemDescription: "", originalPrice: 9.95))
        XCTAssertEqual(tableView.numberOfRowsInSection(3), 1)
        
        
    }
    
     func testNumberRowsInFithSection_IsClassicRoundsCount() {
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        
        
        
        XCTAssertEqual(tableView.numberOfRowsInSection(4), 2)
        
    }
    
    func testNumberRowsInFifthSection_IsLargeRizzoSpecialityPizzaCount() {
        
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        XCTAssertEqual(tableView.numberOfRowsInSection(5), 8)
        
        
    }
    
    
    func testNumberRowsInsixththSection_IsLargeRizzoSpecialityPizza2Count() {
        
        
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
        XCTAssertEqual(tableView.numberOfRowsInSection(6), 8)
        
        
    }
    
    func testNumberRowsInSeventhSection_IsLargeRizzoSpecialityPizza2Count() {
        
        
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        XCTAssertEqual(tableView.numberOfRowsInSection(7), 1)

        
    }
    func testNumberRowsInEightSection_IsBeveragesCount() {
        
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Personal) ", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 17.95))
        
        sut.itemManager?.addItem(FoodItem(title: "Rizzo's Classic Round Pizza (Large", itemDescription: "Commonly known as (rounds), these pies feature the same tangy sauce, grated cheeses and creamy mozzarella as our square pies, but arranged on a super thin, golden baked, delicate crust.", originalPrice: 9.95))
         XCTAssertEqual(tableView.numberOfRowsInSection(8), 2)
        
    }
    
    /*
    func testCellForRow_ReturnsItemCell() {
        
        
        sut.itemManager?.addItem(FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95))
        tableView.reloadData()
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0))
        XCTAssertTrue(cell is MenuItemCell)
    }
 */
    
    
    
    //Deque Cell Test
    func testCellForRow_DequeuesCell() {
        let sut = MenuListDataSupplier()
        let tableView = UITableView()
        tableView.dataSource = sut
        
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.registerClass(MenuItemCell.self,
                                    forCellReuseIdentifier: "MenuItemCell")
        sut.itemManager?.addItem(FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95))
        mockTableView.reloadData()
        _ = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    func testConfigCell_GetsCalledInCellForRow() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.registerClass(MockItemCell.self,
                                    forCellReuseIdentifier: "MenuItemCell")
        let foodItem = FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95)
        sut.itemManager?.addItem(foodItem)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow:
            0,
            inSection: 0)) as! MockItemCell
       XCTAssertEqual(cell.foodItem, foodItem)
    }
    
    
    func testCellInSectionTwo_GetsConfiguredWithDoneItem() {
       // let mockTableView = MockTableView()
        
        let mockTableView = MockTableView(
            frame: CGRect(x: 0, y: 0, width: 320, height: 480),
            style: .Plain)
        
        
        mockTableView.dataSource = sut
        mockTableView.registerClass(MockItemCell.self,
                                    forCellReuseIdentifier: "MenuItemCell")
        let firstItem = FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95)
        sut.itemManager?.addItem(firstItem)
        let secondItem = FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95)
        sut.itemManager?.addItem(secondItem)
        sut.itemManager?.checkItemAtIndex(1)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRowAtIndexPath(
            NSIndexPath(forRow: 0, inSection: 1)) as! MockItemCell
        XCTAssertEqual(cell.foodItem, secondItem)
    }
    
    
    
    
    }


//Mocks

extension MenuListDataSupplierTest {
    class MockTableView : UITableView {
        var cellGotDequeued = false
        override func dequeueReusableCellWithIdentifier(
            identifier: String,
            forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCellWithIdentifier(
                identifier,
                forIndexPath: indexPath)
        }
    }
   
    class MockItemCell : MenuItemCell {
        var foodItem: FoodItem?
        override func configCellWithItem(item: FoodItem) {
            foodItem = item
        }
    }
    
}

