//
//  FoodOrder.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/12/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
struct FoodOrder : Equatable {
    let orderNumber : Int
    
    let customerFirstName : String
    
    let  item : FoodItem
    let deliveryLocation: Location?
    let deliveryType : DeliveryType
    static var order = [FoodItem]()
    
    //
    let timeStamp : Double
    let customerPhoneNumber : UInt
    
    init(item : FoodItem, timeStamp : Double, deliveryLocation: Location? = nil, deliveryType : DeliveryType, customerFirstName : String, let customerPhoneNumber : UInt, orderNumber : Int ){
        self.item = item
        self.timeStamp = timeStamp
        self.deliveryLocation = deliveryLocation
        self.deliveryType = deliveryType
        self.customerFirstName = customerFirstName
        self.customerPhoneNumber = customerPhoneNumber
        self.orderNumber = orderNumber
    }
    
    
    static func addItemToTheOrder(  item : FoodItem) -> [FoodItem] {
        var presentOrder = FoodOrder.order
        presentOrder.append(item)
        FoodOrder.order = presentOrder
        return presentOrder
        
    }
    
    
    
}


func ==(lhs: FoodOrder, rhs: FoodOrder) -> Bool {
    if lhs.deliveryLocation != rhs.deliveryLocation {
        return false
    }
    if lhs.timeStamp != rhs.timeStamp {
        return false
    }
    if lhs.customerFirstName != rhs.customerFirstName {
        return false
    }
    if lhs.customerPhoneNumber != rhs.customerPhoneNumber {
        return false
    }
    if lhs.orderNumber != rhs.orderNumber {
        return false
    }
    if lhs.item != rhs.item {
        return false
    }
    return true
}