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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfSections_IsOne() {
        let sut = MenuListDataSupplier()
        let tableView = UITableView()
        tableView.dataSource = sut
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    /*
    
    func testNumberRowsInSection_IsToDoCount() {
        let sut = MenuListDataSupplier()
        let tableView = UITableView()
        tableView.dataSource = sut
        sut.itemManager?.addItem(FoodItem(title: <#T##String#>, itemDescription: <#T##String#>, originalPrice: <#T##Double#>)
}
 */
}
