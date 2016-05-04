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
  //  let topping : Topping?
    
    
    //  Refractor 1 a short initializer
    init(title:String, itemDescription : String, originalPrice: Double  ){
        self.title = title
        self.itemDescription = itemDescription
        self.originalPrice = originalPrice
       // self.topping = topping
        
    }
    // Description() returns a string representation of the album’s attributes.
    
    var description: String {
        return "title: \(title)" +
            "itemDescription: \(itemDescription)" +
            "originalPrice: \(originalPrice)"
    }

    
    
}

// MARK : EQUATABLE CONFORMANCE
func ==(lhs: FoodItem, rhs: FoodItem) -> Bool {
    if lhs.itemDescription != rhs.itemDescription {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    if lhs.originalPrice != rhs.originalPrice {
        return false
    }
    if  lhs.description != rhs.description {
        return false
    }
    
    return true
    
    
    
}



