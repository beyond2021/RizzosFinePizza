//
//  MenuTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/21/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit


class MenuTableViewController:  UITableViewController {
    
    var floatingSiriButton = UIButton(type: UIButtonType.Custom)
    
    var sectionHeaderTitleArray = ["What's Good","Salads","Garlic Knots", "Calzoni","Classic Rounds","Personal Rizzo's Specialty Pizzas","Large Rizzo's Specialty Pizzas","Desserts","Beverages"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSiri()
               
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpSiri(){
        floatingSiriButton.contentMode = UIViewContentMode.Center
        
        floatingSiriButton.layer.cornerRadius = floatingSiriButton.bounds.size.width / 2
        floatingSiriButton.layer.masksToBounds = true
        
        
        // floatingSiriButton = UIButton(type: UIButtonType.Custom)
        
        
        //set image for button
        floatingSiriButton.setImage(UIImage(named: "siriMike"), forState: UIControlState.Normal)
        //add function for button
        floatingSiriButton.addTarget(self, action:#selector(MenuTableViewController.siriPressed), forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        floatingSiriButton.frame = CGRectMake(0, 0, 80, 80)
        
        tableView.addSubview(floatingSiriButton)
     //   self.view insertSubview:self.oButton aboveSubview:self.view
        self.view.insertSubview(floatingSiriButton, aboveSubview: tableView)
        
        
        
        
    }
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
        returnedView.backgroundColor = UIColor.redColor()
        
        let label = UILabel(frame: CGRectMake(20, 20, 200, 30))
        let fontSize = CGFloat(17)
        label.font = UIFont(name: "Arial-BoldItalicMT", size: fontSize)
        label.textColor = UIColor.whiteColor()
        label.text = sectionHeaderTitleArray[section]
        returnedView.addSubview(label)
        
        return returnedView
        
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func ShoppingCartButtonPressed()  {
        
    }

}

extension MenuTableViewController{
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let myRect = tableView.rectForRowAtIndexPath(indexPath)
        
        //
        cell.frame = CGRectMake(cell.frame.origin.x,
                                cell.frame.origin.y + 568,
                                cell.frame.size.width,
                                cell.frame.size.height)
        
        
        UIView.animateWithDuration(0.5, delay: 0.1*Double(indexPath.row), usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            cell.frame = CGRectMake(myRect.origin.x,
                myRect.origin.y - 30,
                myRect.size.width,
                myRect.size.height)
            
        }) { (finished) -> Void in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                cell.frame = myRect
            })
        }
    }
    
    //MARK : ScrollView Delegate 
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView .isEqual(self.tableView){
            self.floatingSiriButton.transform = CGAffineTransformMakeTranslation(0, scrollView.contentOffset.y + self.view.bounds.height - 100)
            self.view.bringSubviewToFront(floatingSiriButton)
                
            
        }
    }
    func siriPressed(){
        print("\(#function)")
        
    }
    
       
    
}
