//
//  Cart.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 6/4/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
struct CheckOutItem : Equatable {
    
    let title : String
    let itemDescription :String
    let price: Double
    let deliverStatus : DeliveryType
    let orderNumber : Int
    let tax : Float?
    let customerName : String?
    let customerAddress : String?
    let customerEmail : String?
    let customerTelephoneNumber : String?
    
    
    init( title : String, orderNumber : Int, itemDescription :String, deliverStatus : DeliveryType, price: Double, tax : Float? = nil, customerName : String? = nil, customerAddress : String? = nil, customerEmail : String? = nil, customerTelephoneNumber : String? = nil){
        self.itemDescription = itemDescription
        self.orderNumber = orderNumber
        self.deliverStatus = deliverStatus
        self.price = price
        self.tax = tax
        self.customerName = customerName
        self.customerAddress = customerAddress
        self.customerEmail = customerEmail
        self.customerTelephoneNumber = customerTelephoneNumber
        self.title = title
        
    }
}

// MARK : EQUATABLE CONFORMANCE
func ==(lhs: CheckOutItem, rhs: CheckOutItem) -> Bool {
    if lhs.itemDescription != rhs.itemDescription {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    if lhs.orderNumber != rhs.orderNumber {
        return false
    }
    if  lhs.deliverStatus != rhs.deliverStatus {
        return false
    }
    if  lhs.price != rhs.price {
        return false
    }
    if lhs.tax != rhs.tax {
        return false
    }
    if lhs.customerName != rhs.customerName {
        return false
    }
    if lhs.customerAddress != rhs.customerAddress {
        return false
    }
    if  lhs.customerEmail != rhs.customerEmail {
        return false
    }
    if  lhs.customerTelephoneNumber != rhs.customerTelephoneNumber {
        return false
    }
    
    
    return true
    
    
    
}



struct Cart {
   
    }
