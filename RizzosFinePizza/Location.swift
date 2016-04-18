//
//  Location.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
import CoreLocation

struct Location : Equatable {
    
    
    let name : String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String,
         coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

/*
func ==(lhs: Location, rhs: Location) -> Bool {
    return true
}
 */

func ==(lhs: Location, rhs: Location) -> Bool {
    if lhs.coordinate?.latitude != rhs.coordinate?.latitude {
        return false
    }
    if lhs.coordinate?.longitude != rhs.coordinate?.longitude {
        return false
    }
    return true
}
