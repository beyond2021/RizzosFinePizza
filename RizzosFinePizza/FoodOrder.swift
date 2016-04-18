//
//  FoodOrder.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/12/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
struct FoodOrder : Equatable {
    
    
    let  item : FoodItem
    let deliveryLocation: Location?
    let deliveryType : DeliveryType
    static var order = [FoodItem]()
    
    //
    let timeStamp : Double
    
    init(item : FoodItem, timeStamp : Double, deliveryLocation: Location? = nil, deliveryType : DeliveryType ){
        self.item = item
        self.timeStamp = timeStamp
        self.deliveryLocation = deliveryLocation
        self.deliveryType = deliveryType
    }
    
    
    static func addItemToTheOrder(  item : FoodItem) -> [FoodItem] {
        var presentOrder = FoodOrder.order
        presentOrder.append(item)
        FoodOrder.order = presentOrder
        return presentOrder
        
    }
    
}
/*
func ==(lhs: FoodOrder, rhs: FoodOrder) -> Bool {
    return lhs.item == rhs.item
    
}
 
func ==(lhs: FoodOrder, rhs: FoodOrder) -> Bool {
    if lhs.deliveryLocation != rhs.deliveryLocation {
        return false
    }
    return true
}
 */

func ==(lhs: FoodOrder, rhs: FoodOrder) -> Bool {
    if lhs.deliveryLocation?.name != rhs.deliveryLocation?.name {
        return false
    }
    return true
}


