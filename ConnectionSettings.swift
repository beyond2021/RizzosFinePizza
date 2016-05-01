//
//  ConnectionSettings.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/26/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation
public struct ConnectionSettings {
    
    static var clientId = "b3U6ftnbKg0gEeav3o15X2fE-g"
    static var clientSecret = "b3U6IuCY3CoGOqqWRP33JPkEQEonQzY"
    static var apiBaseUrl = "https://api.usergrid.com"
    
    public static func apiURLWithPathComponents(components: String) -> NSURL {
        let baseUrl = NSURL(string: ConnectionSettings.apiBaseUrl)
        let APIUrl = NSURL(string: components, relativeToURL: baseUrl)
        
        return APIUrl!
    }
}
