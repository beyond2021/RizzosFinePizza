//
//  MenuItemsListViewControllerTest.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/18/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class MenuItemsListViewControllerTest: XCTestCase {
    var sut: MenuItemsListViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("MenuItemsListViewController") as! MenuItemsListViewController
        _ = sut.view

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
//        This code first gets a reference to the Main storyboard and then instantiates an
//        instance of ItemListViewController from the storyboard. This works because we
//        have set the Storyboard ID.
        
                XCTAssertNotNil(sut.tableView)
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource() {
                   XCTAssertNotNil(sut.tableView.dataSource)
            XCTAssertTrue(sut.tableView.dataSource is MenuListDataSupplier)
    }
    //Test to make sure that the data provider is also the delegate of the tableView
    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is MenuListDataSupplier)
    }
    
    // Datasource and Delegate should ber the same object
    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? MenuListDataSupplier,
                       sut.tableView.delegate as? MenuListDataSupplier)
    }

}
