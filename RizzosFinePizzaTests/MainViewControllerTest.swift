//
//  MainViewControllerTest.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import XCTest
@testable import RizzosFinePizza

class MainViewControllerTest: XCTestCase {
    
    var sut: MainViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         sut = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MainViewController
        _ = sut.view
        _ = sut.steinwayButton
        _ = sut.uesButton
        _ = sut.lesButton
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ViewIsNotNilAfterViewDidLoad() {
       
       
        XCTAssertNotNil(sut.view)
    }
    
    func test_BackgroundImageViewIsNotNilAfterViewDidLoad(){
               XCTAssertNotNil(sut.bgImageView)
    }
    
    func test_SteinwayButtonIsNotNilAfterViewDidLoad(){
   
    
    XCTAssertNotNil(sut.steinwayButton)
    }
    
    func test_UpperEastSideButtonIsNotNilAfterViewDidLoad(){
   
    
    XCTAssertNotNil(sut.uesButton)
    }
    
    func test_LowerEastSideButtonIsNotNilAfterViewDidLoad(){
       
        
        XCTAssertNotNil(sut.lesButton)
    }


    
    
}
