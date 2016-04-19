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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = MenuItemsListViewController()
        _ = sut.view
        XCTAssertNotNil(sut.tableView)
    }
}
