//
//  FoodItem.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/9/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
//struct GlobalConstants {
//    let Toppings = 2.00
//    
//}

struct FoodItem {
    let title:String
   let itemDescription : String
    let originalPrice : Double
  //  Refractor 1 a short initializer
    init(title:String, itemDescription : String, originalPrice : Double ){
        self.title = title
       self.itemDescription = itemDescription
        self.originalPrice = originalPrice
           }
    
    
    }
