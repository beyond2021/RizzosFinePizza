//
//  Sauce.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/15/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation

enum SauceType : String {
    case BBQ = "Barbecue"
    case ExtraSauce = "ExtraSauce"
    case SideOfHotSauce = "Side Of Hot Sauce"
    case SideOfBasilPesto = "Side of Basil Pesto"
}

struct Sauce {
    let type : SauceType.RawValue?
    
    
}