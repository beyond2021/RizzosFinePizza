//
//  FoodItemExtension.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/4/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//  Fascade

import Foundation
extension FoodItem {
    func ae_tableRepresentation() -> (titles:[String], values:[String]) {
        return (["Title", "Description", "Price"], [ title, itemDescription, "\(originalPrice)"])
    }
}

