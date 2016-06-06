//
//  FoodItemModel.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/16/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//  Must use a class for singleton
//  Import CoreLocations if you are going to store Locations
//  Scope - There must be one instance of this class that is globaly visible
//  The class is going to be final so that it cant be subclassed
//  The initializer will be private so the NO one can mistake create another. Only swift staements in this file can instatiate it.

import Foundation

let globalModel : FoodItemModel = FoodItemModel() // Making the singleton here - Global

final class FoodItemModel {
    /**
     * Properties
     */
    /*
     *Array of Fooditems initialized with no data. This is where will store the data but i will not provide direct access to it. NEVER! Must be accessed through theAPI
     *This will be accessed on another thread so that the save dont block the UI.
     */
    private var arrayOfFoodItems = [Array<FoodItem>]() //
    
    /**
     We will use archiving to save our array into our documents folder. The mechanism used for xib files.
     NSKeyedArchiver and NSKeyedUnarchiver. (NSArray,NSDictionary)It conforns to NCsCoding so we can get it to achive its own contents.
     */
    // This is where we will put it.
    private let archivePath = pathToFileInDocumentsFolder("fooditems")
    // We are going to have a key and the value will be the array.
    private let archiveKey = "FoodItemArray"
    // Lets create a queue to do the work. This queue will perform tasks serially(run one after the other, making it threadsafe). But they all will be on a seperate thread.
    private let queue : dispatch_queue_t = dispatch_queue_create("com.beyond2021.rfp", DISPATCH_QUEUE_SERIAL)
    
    private init(){
    //Phase 1 init - init of my own properties - nothing to do
    // All our properties are initialized so we move to stage 2
    // we now have to call super if we had a parent (super) class but we dont. So super.init not needed
    // So we are in phase 2 where we have self
    // So lets try to read the saved data but we have none so its failable. its like reading a xib file that doesent exist.
    if let m = NSKeyedUnarchiver.unarchiveObjectWithFile(self.archivePath) as? [Array<FoodItem>]{
    //If that works arrayOfFoodItems can be over written.
    arrayOfFoodItems = m
    //Finished with initialization
            }
            }
    
    
   // MARK:- Asynchronous API
    func addItem(foodItem:FoodItem,done:()->()) {
        //if fooditem was a referencetype (class) and the 2nd para done call back is a clousure(referencetype) we are about to cross thread boundaries. however they are not a problem if they are immutable.
        // we will run the append on a seperate queue. block is objc for closure
        dispatch_async(queue){
            self.arrayOfFoodItems.append([foodItem]) // This will be put in a queue and run. FoodItem is captured here.
            //To know when its done
            dispatch_sync(dispatch_get_main_queue(), done)
        }
    }
    
    func addItems(foodItems:[Array<FoodItem>],done:()->()) {
               dispatch_async(queue){
                for f in foodItems{
                    self.arrayOfFoodItems.append(f)
                                  }
             //To know when its done
            dispatch_sync(dispatch_get_main_queue(), done)
        }
    }
    
    func erase(done done: ()->()) {
        self.arrayOfFoodItems.removeAll()
        //To know when its done. Call back on main thread (posted to main runloop)
        dispatch_sync(dispatch_get_main_queue(), done)
    }

   // Next lets do the read get array. 
    func getFoodItemArray(done done : (array : [Array<FoodItem>]) -> ([Array<FoodItem>]) ){
        dispatch_async(queue){
        let copyOfArray = self.arrayOfFoodItems
            //Now call back the main thread with that copy
           // dispatch_sync(dispatch_get_main_queue(), {done(array:copyOfArray)})
            dispatch_sync(dispatch_get_main_queue()) {
             done(array:copyOfArray)
                
            }
        
        }
    }
    
   
    
    
    //MARK: - Persist the data
    func save(done done : ()->() ) {
        dispatch_async(queue){
            //for classes
            NSKeyedArchiver.archiveRootObject(self.arrayOfFoodItems, toFile: self.archivePath)
            //To know when its done. Call back on main thread (posted to main runloop)
            dispatch_sync(dispatch_get_main_queue(), done)

                 }
            }
    
    //MARK: - Is there any data 
    func isEmpty(done done: (isEmpty:Bool) ->()){
        dispatch_async(queue){
            let result = self.arrayOfFoodItems.count == 0 //? true:false
            //Call back block
            dispatch_sync(dispatch_get_main_queue()){
                done(isEmpty:result)
            }
            
        }
        
    }
    
}
