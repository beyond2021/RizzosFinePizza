//
//  FoodItemListTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/10/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class FoodItemListTableViewController: UITableViewController {
    
    var cart : FoodItem?
   
    
    //MARK: - Data Source
    lazy var allFoodItems : [[FoodItem]]  = {
        return DataArray.data
    }()// An Array Of Food Items. A computed property
    var sectionHeaderTitleArray = ["Plain Pizza","Create Your Own Pizza","Speciality Pizza","Calzones","Knots","Salads","Drinks","Dessert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PizzaCellSlim", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "PizzaCellSlim")
      
        tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "PreCart" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let foodItemToPass = allFoodItems[indexPath.section][indexPath.row]
                let controller = segue.destinationViewController as! PrepareForCartTableViewController
                controller.foodItem = foodItemToPass
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }
      
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allFoodItems.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows: Int
        numberOfRows = allFoodItems[section].count
        return numberOfRows
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath.row) selected")
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! PizzaCellSlim
        selectedCell.contentView.backgroundColor = UIColor(red:217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        //  print("cell items: \(selectedCell.foodItem)")
        performSegueWithIdentifier("PreCart", sender: PizzaCellSlim())
    }
    
    
    // 5
    /*
     override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
     return 66
     }
     */
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PizzaCellSlim",
                                                               forIndexPath: indexPath) as? PizzaCellSlim
        if cell == nil {
            cell = PizzaCellSlim(style: UITableViewCellStyle.Default, reuseIdentifier: "PizzaCellSlim")
        }
        let foodType = allFoodItems[indexPath.section]
        let foodItemInCell = foodType[indexPath.row]
        cell!.foodItem = foodItemInCell
        cell!.foodTitleLabel.text = foodItemInCell.title
        cell?.foodItemDescriptionLabel.text = foodItemInCell.itemDescription
        return cell!
    }
    // MARK: - Delegate
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRectMake(0.0, 0.0,320.0, 35.0)) //set these values as necessary
        returnedView.backgroundColor = UIColor(red: 190.0/255.0, green: 96.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        let label = UILabel(frame: CGRectMake(20, 2, 300, 30))
        let fontSize = CGFloat(19)
        label.font = UIFont(name: "Helvetica-Bold", size: fontSize)
        label.textColor = UIColor.whiteColor()
        label.text = sectionHeaderTitleArray[section]
        returnedView.addSubview(label)
        return returnedView
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    // MARK: - Unwind Segue
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    

}
