//
//  CartItem.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/15/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation

enum Ricotta : String {
    case extra = "extra"
    case regular = "regular"
}
enum Mozzarella : String {
    case extra = "extra"
    case regular = "regular"
}
enum Parmigiano : String {
    case extra = "extra"
    case regular = "regular"
}
enum Romano : String {
    case extra = "extra"
    case regular = "regular"
}

struct Cheese {
    let ricotta : Ricotta.RawValue?
    let mozzarella : Mozzarella.RawValue?
    let parmigiano : Parmigiano.RawValue?
    let romano : Romano.RawValue?
    let price : Double
    //init()

}



struct CartItem : Equatable {
    
    let title:String
    let itemDescription : String
    let itemTotalBeforeCart : Double
    let foodImage : UIImage?
    /**
    var topping : [Topping]
    var extraCheese : Cheese
    var extraSauce : Sauce?
    var delivery : DeliveryType
    var glutenFree = false
 */
    
    
    //  Refractor 1 a short initializer
    init(title:String, itemDescription : String, itemTotalBeforeCart : Double, foodImage : UIImage? = nil ){
        self.title = title
        self.itemDescription = itemDescription
        self.itemTotalBeforeCart = itemTotalBeforeCart
        self.foodImage = foodImage
        // self.topping = topping
        
    }
    // Description() returns a string representation of the album’s attributes.
    
    var description: String {
        return "title: \(title)" +
            "itemDescription: \(itemDescription)" +
            "originalPrice: \(itemTotalBeforeCart)"
    }
    }

// MARK : EQUATABLE CONFORMANCE
func ==(lhs: CartItem, rhs: CartItem) -> Bool {
    if lhs.itemDescription != rhs.itemDescription {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    if lhs.itemTotalBeforeCart != rhs.itemTotalBeforeCart {
        return false
    }
    if  lhs.description != rhs.description {
        return false
    }
    if  lhs.foodImage != rhs.foodImage {
        return false
    }
    
    
    return true
    
    
    
}
