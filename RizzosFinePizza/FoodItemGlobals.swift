//
//  FoodItemGlobals.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/16/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//  They are both constants so they a relatively safe = Thread Safe

import Foundation

//lazyly created constant that is the path tp the documents folder.
let pathToDocumentsInFolder : String = {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
   }()
//This is a closure taking a filename and appending it.
let pathToFileInDocumentsFolder = { (fileName:String) -> String in
    return (pathToDocumentsInFolder as NSString).stringByAppendingPathComponent(fileName)
}
