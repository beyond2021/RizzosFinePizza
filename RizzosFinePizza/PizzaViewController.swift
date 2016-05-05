//
//  PizzaViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/4/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//



import UIKit
import Foundation

let PizzaCellIdentifier = "PizzaCell"

enum pizzaSection : Int{
    case Plain
    case CreateYourOwn
    case Speciality
    
}



protocol PizzaViewControllerDelegate : class {
    func dissmissPizza()
}


class PizzaViewController: UIViewController {
    var sectionHeaderTitleArray = ["Plain","Create Your Own","Speciality"]
    
    weak var delegate : PizzaViewControllerDelegate?
    var itemManager: ModelAPI?
    
    @IBOutlet weak var twitterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twitterTableView.delegate = self
        itemManager = ModelAPI()
    
        /*
       
     let twitterScrollTableView = MBTwitterScroll(tableViewWithBackgound: UIImage(named:"TwitterScrollBG" ), avatarImage: UIImage(named: "track"), titleString: "RIZZOS", subtitleString: "Pizza At Its Finnest!", buttonTitle: "Menu")
        twitterScrollTableView.delegate = self
        
             view.addSubview(twitterScrollTableView)
 */

        
        
    }
    

}
extension PizzaViewController: MBTwitterScrollDelegate, UITableViewDelegate,UITableViewDataSource {
      func recievedMBTwitterScrollEvent() {
        
    }
    
    func recievedMBTwitterScrollButtonClicked() {
        print("\(#function)")
     //   delegate?.dissmissPizza()
        dismissViewControllerAnimated(true) { 
           print("Pizza is dismissed")
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
           
                  }
        return numberOfRows
        
            }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(PizzaCellIdentifier,
                                                               forIndexPath: indexPath) as? PizzaCell
        
        
        
        if cell == nil {
            cell = PizzaCell(style: UITableViewCellStyle.Default, reuseIdentifier: PizzaCellIdentifier)
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
           // cell!.foodNameLabel.text = "Personal Round"
        case .CreateYourOwn:
            item = itemManager.cyoPizzaItemAtIndex(indexPath.row)
          
            
        case .Speciality:
           item = itemManager.specialityPizzaItemAtIndex(indexPath.row)
         // cell!.foodNameLabel.text = "Large Square"
            
        }
        cell!.configCellWithItem(item)

        
        
        cell!.foodNameLabel.text = "Large Round"
        
//        if let foodItem = itemManager?.checkItemAtIndex(indexPath.row) {
//            cell.configCellWithItem(foodItem)
//        }
        return cell!
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        /*
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
 */
        
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }

    
    
    
    
}
