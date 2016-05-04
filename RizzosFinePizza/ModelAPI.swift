//
//  ModelAPI.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//  Entry Point a Singleton object as the entry point to manage the Food items

import UIKit

class ModelAPI: NSObject {
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool
    //1
    class var sharedInstance: ModelAPI {
        //2
        struct Singleton {
            //3
            static let instance = ModelAPI()
        }
        //4
        return Singleton.instance
    }
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        
        super.init()
    }
    
    /*
     The class first updates the data locally, and then if there’s an internet connection, it updates the remote server
 
 */
    
    //
    func getPizzas() -> [FoodItem] {
        return persistencyManager.getPizza()    }
    
    func addAlbum(pizza: FoodItem, index: Int) {
        persistencyManager.addPizza(pizza, index: index)
        if isOnline {
            httpClient.postRequest("/api/addPizza", body: pizza.description)
        }
    }
    
    func deleteAlbum(index: Int) {
        persistencyManager.deletePizzaAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deletePizza", body: "\(index)")
        }
    }
    //
    func getCalzones() -> [FoodItem] {
        return persistencyManager.getCalzone()    }
    
    func addCalzone(calzone: FoodItem, index: Int) {
        persistencyManager.addPizza(calzone, index: index)
        if isOnline {
            httpClient.postRequest("/api/addCalzone", body: calzone.description)
        }
    }
    
    func deleteCalzone(index: Int) {
        persistencyManager.deleteCalzoneAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteCalzone", body: "\(index)")
        }
    }
    //
    func getGarlicKnots() -> [FoodItem] {
        return persistencyManager.getGarlicKnots()    }
    
    func addGarlicKnot(knot: FoodItem, index: Int) {
        persistencyManager.addGarlicKnots(knot, index: index)
        if isOnline {
            httpClient.postRequest("/api/addGarlicKnot", body: knot.description)
        }
    }
    
    func deleteGarlicKnot(index: Int) {
        persistencyManager.deleteGarlicKnotAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteGarlicKnot", body: "\(index)")
        }
    }
    //
    func getSalads() -> [FoodItem] {
        return persistencyManager.getSalads()    }
    
    func addSalad(aSalad: FoodItem, index: Int) {
        persistencyManager.addSalads(aSalad, index: index)
        if isOnline {
            httpClient.postRequest("/api/addSalad", body: aSalad.description)
        }
    }
    
    func deleteSalad(index: Int) {
        persistencyManager.deleteSaladAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteSalad", body: "\(index)")
        }
    }
    //

    func getDrinks() -> [FoodItem] {
        return persistencyManager.getDrinks()    }
    
    func addDrink(aDrink: FoodItem, index: Int) {
        persistencyManager.addDrinks(aDrink, index: index)
        if isOnline {
            httpClient.postRequest("/api/addDrink", body: aDrink.description)
        }
    }
    
    func deleteDrink(index: Int) {
        persistencyManager.deleteDrinkAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteDrink", body: "\(index)")
        }
    }
    //
    
    func getDesserts() -> [FoodItem] {
        return persistencyManager.getDesserts()    }
    
    func addDessert(aDessert: FoodItem, index: Int) {
        persistencyManager.addDessert(aDessert, index: index)
        if isOnline {
            httpClient.postRequest("/api/addDessert", body: aDessert.description)
        }
    }
    
    func deleteDessert(index: Int) {
        persistencyManager.deleteDessertAtIndex(index)
        if isOnline {
            httpClient.postRequest("/api/deleteDessert", body: "\(index)")
        }
    }


    
    

}
