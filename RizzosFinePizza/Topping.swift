//
//  Topping.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/18/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
enum ToppingName : String,  Equatable {
    case Chicken = "Chicken"
    case Onions = "Onions"
    case Meatball = "Meatball"
    case Spinach = "Spinach"
    case Eggplant = "Eggplant"
    case Tomato = "Tomato"
    case Capers = "Capers"
    case HotSauce = "Hotsauce"
    case Anchovies = "Anchovies"
    case Pesto = "Pesto"
    case BellPepper = "Bell Pepper"
    case FreshBasil = "Fresh Basil"
    case Bacon = "Bacon"
    case Sausage = "Sausage"
    case Pepperoni = "Pepperoni"
    case FreshGarlic = "Fresh Garlic"
    case BlackOlives = "Black Olives"
    case GreenOlives = "Green Olives"
    case PlumTomato = "Plum Tomato"
    case FreshPepper = "Fresh Pepper"
    case Mushroom = "Mushroom"
    case RoastedPeppers = "Roasted Peppers"
    case ToastedAnchovy = "Toasted Anchovy"
    case Oregano = "Oregano"
}



struct Topping : Equatable{
    let name : ToppingName.RawValue
    let price : Double
   
    
    init(name : String, let price : Double){
        self.name = name
        self.price = 2.00
      
    }
    
}

func ==(lhs: Topping, rhs: Topping) -> Bool {
    if lhs.name != rhs.name {
        return false
    }

    return true
}
