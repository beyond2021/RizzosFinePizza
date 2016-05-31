//
//  FoodItemListTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/10/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
var pointVariable = 0
class FoodItemListTableViewController: UITableViewController, PrepareForCartTableViewControllerDelegate {
    
    var cartItem : CartItem?
    
    var cart : FoodItem?
    var point : Int?
    
    
   
    
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
        scrollToPoint(pointVariable)
            }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
          scrollToPoint(pointVariable)
        tableView.reloadData()
        setUpSiri()
    }
    
    // MARK: - Navigation
    /*
     if let indexPath = self.tableView.indexPathForSelectedRow {
     let object = objects[indexPath.row] as! NSDate
     let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
     controller.detailItem = object
     controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
     controller.navigationItem.leftItemsSupplementBackButton = true
 
 */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                if segue.identifier == "PreCart" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let foodItemToPass = allFoodItems[indexPath.section][indexPath.row] as FoodItem
                
                                
                let controller = segue.destinationViewController as! PrepareForCartTableViewController
                controller.delegate = self
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
        if let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as? PizzaCellSlim {
            selectedCell.contentView.backgroundColor = UIColor(red:102.0/255.0, green: 36.0/255.0, blue: 35.0/255.0, alpha: 1.0)
            pointVariable = indexPath.section
            performSegueWithIdentifier("PreCart", sender: PizzaCellSlim())
        }
        
        
         print("\(indexPath.section)")
//        pointVariable = indexPath.section
//        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! PizzaCellSlim
//        selectedCell.contentView.backgroundColor = UIColor(red:102.0/255.0, green: 36.0/255.0, blue: 35.0/255.0, alpha: 1.0)
//        performSegueWithIdentifier("PreCart", sender: PizzaCellSlim())
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
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
//        FVCustomAlertView.showDefaultDoneAlertOnView(self.view, withTitle: "Done", withBlur: true, allowTap: true)

    
    }
    
    @IBAction func backFromCart(segue: UIStoryboardSegue) {
//        FVCustomAlertView.showDefaultDoneAlertOnView(self.view, withTitle: "Dont Hurt Yourself :)", withBlur: true, allowTap: true)
        pointVariable = 0
        
        
    }
    // MARK: - Unwind Segue
    func scrollToPoint(point: Int){
        let indexPath = NSIndexPath(forRow: 0, inSection: point)
        self.tableView.scrollToRowAtIndexPath(indexPath,
                                              atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
        
        /*
        let delay = 0.1 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(time, dispatch_get_main_queue(), {
            
            let numberOfSections = self.tableView.numberOfSections
            let numberOfRows = self.tableView.numberOfRowsInSection(numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: point - 1)
                self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
            }
            
        })
 */
        
        
    }
    
    
    
    deinit{
        
        pointVariable = 0
    }
    
    func dissmissWithUpdatedOptions(updatedFoodItems:FoodItem?){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //MARK :- Siri
    func setUpSiri(){
        let floatingSiriButton = UIButton()
        floatingSiriButton.contentMode = UIViewContentMode.Center
        
        floatingSiriButton.layer.cornerRadius = floatingSiriButton.bounds.size.width / 2
        floatingSiriButton.layer.masksToBounds = true
        
        
        // floatingSiriButton = UIButton(type: UIButtonType.Custom)
        
        
        //set image for button
        floatingSiriButton.setImage(UIImage(named: "mike"), forState: UIControlState.Normal)
        //add function for button
        floatingSiriButton.addTarget(self, action:#selector(PrepareForCartTableViewController.siriPressed), forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        floatingSiriButton.frame = CGRectMake(0, view.bounds.height - 40, 80, 80)
        
         view.addSubview(floatingSiriButton)
                self.view.insertSubview(floatingSiriButton, aboveSubview: tableView)
    }
    

}
