//
//  MenuItemsListViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/18/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class MenuItemsListViewController: UIViewController {
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView = UITableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
