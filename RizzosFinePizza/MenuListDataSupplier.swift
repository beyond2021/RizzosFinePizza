//
//  MenuListDataSupplier.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/19/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class MenuListDataSupplier: NSObject, UITableViewDataSource {
    var itemManager: ItemManager?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows: Int
        switch section {
        case 0:
            numberOfRows = 1
        case 1:
            numberOfRows = 3
        
        case 2:
        numberOfRows = 1
        case 3:
        numberOfRows = 1
        case 4:
            numberOfRows = 2
        case 5:
            numberOfRows = 8
        case 6:
            numberOfRows = 8
        case 7:
            numberOfRows = 1
        case 8:
            numberOfRows = 2
            
        
        default:
            numberOfRows = 0
        }
            
            
        
        
        return numberOfRows
        
        
        
        /*
        if section == 0{
            return 6
        }
        if section == 1{
            return 3
        }
        if section == 2{
            return 1
        }
        if section == 3{
            return 1
        }
        if section == 4{
            return 2
        }
        if section == 5{
            return 8
        }
        if section == 6{
            return 8
        }
        if section == 7{
            return 1
        }
        if section == 8{
            return 2
        }
        
        return 0
 
 */
    }
    
    /*
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier(
                "MenuItemCell",
                forIndexPath: indexPath) as! MenuItemCell
            
            cell.configCellWithItem(FoodItem(title: "Aumma Aumma Pizza (Large)", itemDescription: "Sausage, meatball, ricotta, sauce, mozzarella.", originalPrice: 23.95))
            return cell
            
    }
 */
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell",
            forIndexPath: indexPath) as! MenuItemCell
        if let foodItem = itemManager?.checkItemAtIndex(indexPath.row) {
            cell.configCellWithItem(foodItem)
        }
        return cell
    }
    
}


