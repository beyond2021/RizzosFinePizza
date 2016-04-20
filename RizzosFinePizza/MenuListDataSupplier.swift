//
//  MenuListDataSupplier.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/19/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class MenuListDataSupplier: NSObject, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            return UITableViewCell()
    }
}


