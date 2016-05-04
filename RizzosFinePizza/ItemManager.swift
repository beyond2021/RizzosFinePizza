//
//  ItemManager.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/12/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import Foundation

class ItemManager {
    
    //Items added to cart count is always equal to items in the Cart
    var itemsAddedToCartCount : Int { return itemsInTheCart.count}
    var priceValue = 0.00
    var pricelistItemCount : Int { return pricslist.count}
    // Pizza
    
    //
    

    
    
    private var pricslist = [Double]()
    private var itemsInTheCart = [FoodItem]()
    /*
     The array is private because we want to encapsulate the underlying
     array. In addItems(_:), the item that's passed in is added to the array, and in
     itemAtIndex(_:), the item at the specified index is returned.
     
     */
    
    
    
    //MARK : Add An Item To The FoodItems List
    func addItem(item: FoodItem) {
       
        itemsInTheCart.append(item)
        print("Items in cart count: \(itemsAddedToCartCount)")
        
    }
    
    
    //MARK : Get the selected Item
    func checkItemAtIndex(index: Int) -> FoodItem {
     
      return itemsInTheCart[index]
        
    }
    
    //MARK : Removes Item From Order
    func removeItemAtIndex(index: Int) {
        _ = itemsInTheCart.removeAtIndex(index)
    }
    
    //MARK : Item Added To Cart Method
    
    func itemAddedToCartAtIndex(index: Int) -> FoodItem {

        return itemsInTheCart[index]
    }
    
    //MARK : Empty Cart
    func removeAllItemsFromCart(){
       itemsInTheCart.removeAll()
        
    }
    
    //MARK: TheNames Of All TheItems In The Cart
    }

extension ItemManager : SequenceType {
    typealias Generator = AnyGenerator<FoodItem>
    
    //MARK: TheNames Of All TheItems In The Cart
    func generate() -> Generator {
        var index = 0
        return AnyGenerator {
            if index < self.itemsInTheCart.count {
                return self.itemsInTheCart[index++]
            }
            return nil
        }
    }
    
    func addItemPriceToList(item: Double) -> Double {
                 pricslist.append(item)
        
        func f1(a : Double, _ b: Double) -> Double {
            
            return a+b
        }
        let subTotal = pricslist.reduce(0, combine: f1)
        print("Sub Total is :  \(subTotal)")
        
        return subTotal
       
         
    }
    
}
