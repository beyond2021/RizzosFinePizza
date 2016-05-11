//
//  FoodItemListTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/10/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class FoodItemListTableViewController: UITableViewController {
    var selectedItem : FoodItem?
    
    var foodItem : FoodItem?
    var itemManager: ModelAPI?
    //var items = [FoodItem]()
    var sectionHeaderTitleArray = ["Plain Pizza","Create Your Own Pizza","Speciality Pizza","Calzones","Knots","Salads","Drinks","Dessert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        let nib = UINib(nibName: "PizzaCellSlim", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "PizzaCellSlim")
        itemManager = ModelAPI()
       tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableViewAutomaticDimension

        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier{
            switch segueIdentifier{
            case "PreCart":
                            
                if  let segueToPrepare = segue.destinationViewController as? PrepareForCartTableViewController {
                    segueToPrepare.foodItem = foodItem
                }
                
            default: break
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionHeaderTitleArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else { return 0 }
        
        
        guard let itemSection = pizzaSection(rawValue: section) else {
            fatalError()
        }
        let numberOfRows: Int
        switch itemSection {
        case .Plain:
            numberOfRows = itemManager.getPlainPizzasForSection()
            
            
        case .CreateYourOwn:
            numberOfRows = itemManager.getCYOPizzasForSection()
            
        case .Speciality:
            numberOfRows = itemManager.getSpecialityPizzasForSection()
        case .Calzones:
            numberOfRows = itemManager.getCalzoneForSection()
        case .Knots:
            numberOfRows = itemManager.getKnotsForSection()
            
            
        case .Salads:
            numberOfRows = itemManager.getSaladForSection()
        case .Drinks:
            numberOfRows = itemManager.getDrinksForSection()
        case .Dessert:
            numberOfRows = itemManager.getDessertForSection()
            
            
        }
        return numberOfRows

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath.row) selected")
      //  var selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        
      //  let selectedItem = foodItem[indexPath.row]
       // performSegueWithIdentifier("PreCart", sender: self)
     //  UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! PizzaCellSlim
        selectedCell.contentView.backgroundColor = UIColor(red:217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0)
       selectedCell.foodItem = selectedItem
       performSegueWithIdentifier("PreCart", sender: self) 
        
    }
    
    // 5
    /*
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66
    }
 */

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       // let cell = tableView.dequeueReusableCellWithIdentifier("PizzaCellSlim", forIndexPath: indexPath)

        
       
     var cell = tableView.dequeueReusableCellWithIdentifier("PizzaCellSlim",
     forIndexPath: indexPath) as? PizzaCellSlim
     
     
     
     if cell == nil {
     cell = PizzaCellSlim(style: UITableViewCellStyle.Default, reuseIdentifier: "PizzaCellSlim")
     }
 
     
     
     guard let itemManager = itemManager else { fatalError() }
     guard let section = pizzaSection(rawValue: indexPath.section) else
     {
     fatalError()
     }
     let item: FoodItem
     switch section {
     case .Plain:
     item = itemManager.plainPizzaItemAtIndex(indexPath.row)
       foodItem = item
     
     case .CreateYourOwn:
     item = itemManager.cyoPizzaItemAtIndex(indexPath.row)
     foodItem = item
     case .Speciality:
     item = itemManager.specialityPizzaItemAtIndex(indexPath.row)
      foodItem = item
     
     case .Calzones:
     item = itemManager.calzonesItemAtIndex(indexPath.row)
       foodItem = item
     
     case .Knots:
     item = itemManager.knotsItemAtIndex(indexPath.row)
foodItem = item
     
     
     case .Salads:
     item = itemManager.saladItemAtIndex(indexPath.row)
        foodItem = item
     case .Drinks:
     item = itemManager.drinkItemAtIndex(indexPath.row)
     foodItem = item
     case .Dessert:
     item = itemManager.dessertItemAtIndex(indexPath.row)
     foodItem = item
     
     
     }
        cell!.foodItem = item
   cell!.foodTitleLabel.text = item.title
        cell?.foodItemDescriptionLabel.text = item.itemDescription
        return cell!
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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

    
    

}
