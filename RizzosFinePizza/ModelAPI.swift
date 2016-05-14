//
//  ModelAPI.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//  Entry Point a Singleton object as the entry point to manage the Food items
//  The class first updates the data locally, and then if there’s an internet connection, it updates the remote server
import UIKit

class ModelAPI: NSObject {
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool
    
     var allItems = [FoodItem]()
//MARK:- Singleton Action
//Singleton------------------------------------------------------------------------------------------------------
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
//MARK:- Initializer
//Initializer--------------------------------------------------------------------------------------------------
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        self.allItems = persistencyManager.getAllFoodItems()
        super.init()
    }
 //MARK:- All Items
     func allFoodItems() -> [FoodItem]{
        return persistencyManager.getAllFoodItems()
     }
    func getTheNumberOfAllItems() -> Int {
        return persistencyManager.getAllFoodItemsCount()
       }
 //MARK:- All Pizzas
    func getPizzas() -> [FoodItem] {
        return persistencyManager.getPizza()
    }
        func getPlainPizzas() -> [FoodItem]{
        return persistencyManager.getPlainPizzas()
    }
    func addPizza(pizza: FoodItem, index: Int) {
        persistencyManager.addPizza(pizza, index: index)
        if isOnline {
            httpClient.postRequest("/api/addPizza", body: pizza.description)
        }
    }
    
    
    //
       func getCreateYourOwnPizzas() -> [FoodItem]{
        return persistencyManager.getCreateYourOwnPizzas()
    }
    func getSpecialityPizza() -> [FoodItem]{
        return persistencyManager.getSpecialityPizza()
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
    
    //MARK :Data Sections
    func getPlainPizzasForSection() -> Int {
        return persistencyManager.getPlainPizzasForSection()
        
    }
    func getCYOPizzasForSection() -> Int {
        return persistencyManager.getCYOPizzasForSection()
        
    }
    func getSpecialityPizzasForSection() -> Int {
        return persistencyManager.getSpecialityPizzasForSection()
        
    }
    
    //MARK: Data Rows In Sections
    func plainPizzaItemAtIndex(index: Int) -> FoodItem {
          return persistencyManager.plainPizzaItemAtIndex(index)
     }
    
    
    
        func cyoPizzaItemAtIndex(index: Int) -> FoodItem {
             return persistencyManager.cyoPizzaItemAtIndex(index)
    }
    
    
    
       func specialityPizzaItemAtIndex(index: Int) -> FoodItem {
          return persistencyManager.specialityPizzaItemAtIndex(index)
        
    }

    //
    func getCalzoneForSection() -> Int {
        return persistencyManager.getCalzoneForSection()
        
    }
    func calzonesItemAtIndex(index: Int) -> FoodItem {
        
        return persistencyManager.calzonesItemAtIndex(index)
        
    }
    func getCalzone() -> [FoodItem]{
        return persistencyManager.getCalzone()
        
    }

    
    func getKnotsForSection() -> Int {
        return persistencyManager.getKnotsForSection()
        
    }
    func knotsItemAtIndex(index: Int) -> FoodItem {
        
        return persistencyManager.knotsItemAtIndex(index)
        
    }
    
    func getSaladForSection() -> Int {
        return persistencyManager.getSaladForSection()
        
    }
    func saladItemAtIndex(index: Int) -> FoodItem {
        
        return persistencyManager.saladItemAtIndex(index)
        
    }
    
    func getDrinksForSection() -> Int {
        return persistencyManager.getDrinksForSection()
        
    }
    func drinkItemAtIndex(index: Int) -> FoodItem {
        
        return persistencyManager.drinkItemAtIndex(index)
        
    }
    func getDessertForSection() -> Int {
        return persistencyManager.getDessertForSection()
        
    }
    func dessertItemAtIndex(index: Int) -> FoodItem {
        
        return persistencyManager.dessertItemAtIndex(index)
        
    }
    
  
  
    

}
