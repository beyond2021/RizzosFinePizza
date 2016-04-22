//
//  MenuTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/21/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var sectionHeaderTitleArray = ["What's Good","Salads","Garlic Knots", "Calzoni","Classic Rounds","Personal Rizzo's Specialty Pizzas","Large Rizzo's Specialty Pizzas","Desserts","Beverages"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
 */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
    /*
     - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
     // you can get the title you statically defined in the storyboard
     NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
     
     // create and return a custom view
     UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 50.0f)];
     customLabel.text = sectionTitle;
     return customLabel;
     }
     
     - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
     // return a custom height here if necessary
     return 50.0f;
     }
 
 */
    
   // MARK: - Delegate Methods 
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRectMake(0.0, 0.0, 220.0, 50.0)) //set these values as necessary
        returnedView.backgroundColor = UIColor.lightGrayColor()
        
        let label = UILabel(frame: CGRectMake(20, 20, 200, 30))
        let fontSize = CGFloat(20)
        label.font = UIFont(name: "Arial-BoldItalicMT", size: fontSize)
        label.textColor = UIColor.redColor()
        label.text = self.sectionHeaderTitleArray[section]
        returnedView.addSubview(label)
        
        return returnedView
        
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75.0
    }

}
