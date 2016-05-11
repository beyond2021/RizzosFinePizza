//
//  PrepareForCartTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class PrepareForCartTableViewController: UITableViewController {
    var foodItem : FoodItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        if foodItem != nil{
           print("Food Item is: \(foodItem)")
         
        } else {
           print("Food Item is: NIL")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  
}
