//
//  LocationManager.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/14/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
import CoreLocation


class LManager: CLLocationManager{
    lazy var locationManager : CLLocationManager = {
        let loc = CLLocationManager()
        // Set up location manager with defaults
        loc.desiredAccuracy = kCLLocationAccuracyBest
        loc.distanceFilter = kCLDistanceFilterNone
        // loc.delegate = self // Set ourself up for call backs(Delegate)
        
        //Optimization of battery
        loc.pausesLocationUpdatesAutomatically = true
        loc.activityType = CLActivityType.Fitness
        loc.allowsBackgroundLocationUpdates = false
        // All set up so we can now ask for permission
        
        return loc
        
    }()
    
    
}

/*
struct LocationManager {
    lazy var locationManager : CLLocationManager = {
        let loc = CLLocationManager()
        // Set up location manager with defaults
        loc.desiredAccuracy = kCLLocationAccuracyBest
        loc.distanceFilter = kCLDistanceFilterNone
       // loc.delegate = self // Set ourself up for call backs(Delegate)
        
        //Optimization of battery
        loc.pausesLocationUpdatesAutomatically = true
        loc.activityType = CLActivityType.Fitness
        loc.allowsBackgroundLocationUpdates = false
        // All set up so we can now ask for permission
        
        return loc
        
    }()

}
 */