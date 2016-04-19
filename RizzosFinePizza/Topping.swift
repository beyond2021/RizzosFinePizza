//
//  Topping.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/18/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
struct Topping : Equatable{
    let name : String
    let toppingDescription : String
    let toppingPrice : Double
    
    init(name : String, toppingDescription : String, toppingPrice : Double){
        self.name = name
        self.toppingDescription = toppingDescription
        self.toppingPrice = toppingPrice
    }
    
}

func ==(lhs: Topping, rhs: Topping) -> Bool {
    if lhs.name != rhs.name {
        return false
    }
    if lhs.toppingDescription != rhs.toppingDescription {
        return false
    }
        if lhs.toppingPrice != rhs.toppingPrice {
            return false
        
    }
    return true
}
