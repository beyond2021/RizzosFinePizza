//
//  FoodItem.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/9/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation

/*
public protocol Equatable {
    @warn_unused_result
    public func ==(lhs: Self, rhs: Self) -> Bool
}
 */



struct FoodItem : Equatable {
    let title:String
    let itemDescription : String
    let originalPrice : Double
    
    
    //  Refractor 1 a short initializer
    init(title:String, itemDescription : String, originalPrice: Double  ){
        self.title = title
        self.itemDescription = itemDescription
        self.originalPrice = originalPrice
        
    }
}

// MARK : EQUATABLE CONFORMANCE
func ==(lhs: FoodItem, rhs: FoodItem) -> Bool {
    return true
}

/*
 OR
func ==(lhs: FoodItem, rhs: FoodItem) -> Bool {
    return lhs.title == rhs.title && rhs.itemDescription == lhs.itemDescription && rhs.originalPrice == lhs.originalPrice
 
}
*/
