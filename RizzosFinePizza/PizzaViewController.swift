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
let offset_HeaderStop:CGFloat = 40.0 // At this offset the Header stops its transformations

var foodItem:FoodItem?
enum pizzaSection : Int{
    case Plain
    case CreateYourOwn
    case Speciality
    case Calzones
    case Knots
    case Salads
    case Drinks
    case Dessert
    
}



protocol PizzaViewControllerDelegate : class {
    func dissmissPizza()
}


class PizzaViewController: UIViewController {
    var sectionHeaderTitleArray = ["Plain Pizza","Create Your Own Pizza","Speciality Pizza","Calzones","Knots","Salads","Drinks","Dessert"]
    
    weak var delegate : PizzaViewControllerDelegate?
    var itemManager: ModelAPI?
    
    @IBOutlet weak var twitterTableView: UITableView!
    
   // @IBOutlet weak var header: UIView!
    var blurredHeaderImageView:UIImageView?
    var headerImageView:UIImageView!
    var headerBlurImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twitterTableView.delegate = self
        itemManager = ModelAPI()
        
        twitterTableView.estimatedRowHeight = 151.0
        twitterTableView.rowHeight = UITableViewAutomaticDimension
       // twitterTableView.sectionIndexBackgroundColor = UIColor.clearColor()
    
        
//       
//     let twitterScrollTableView = MBTwitterScroll(tableViewWithBackgound: UIImage(named:"TwitterScrollBG" ), avatarImage: UIImage(named: "track"), titleString: "RIZZOS", subtitleString: "Pizza At Its Finnest!", buttonTitle: "Menu")
//        twitterScrollTableView.delegate = self
        
           //  view.addSubview(twitterScrollTableView)
//         let twitterScrollTableView = MBTwitterScroll(scrollViewWithBackgound: UIImage(named:"TwitterScrollBG" ), avatarImage: UIImage(named: "track"), titleString: "RIZZOS", subtitleString: "Pizza At Its Finnest!", buttonTitle: "Menu", contentHeight: 170)
//twitterScrollTableView.delegate = self
//        
//        view.addSubview(twitterScrollTableView)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "addToCart":
                let cell = sender as! PizzaCell
                if let indexPath = twitterTableView.indexPathForCell(cell){
                let segueToMVC = segue.destinationViewController as! AddToCartViewController
                  
               //     foodItem = FoodItem(title: , itemDescription: <#T##String#>, originalPrice: )
                /*
                  segueToMVC.priceLabel.text = "$23.00"
                    segueToMVC.descriptionLabel.text = ""
                    segueToMVC.quantityNumberLabel.text = "1"
                     
                     func configCellWithItem(item: FoodItem){
                     foodNameLabel.text = item.title
                     pizzaDescriptionLabel.text = item.itemDescription
                     largeSquarePriceLabel.text = "$"+"\(item.originalPrice)"
                     
                     
                     
                     }
                     
                 */
                    
                    
                    
                }
            default:
                break
            }
            
            
        }
                
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // 1
        let nav = self.navigationController?.navigationBar
        // 2
               // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "titleView")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
        
        
        // Header - Image
        
        /*
        headerImageView = UIImageView(frame: header.bounds)
        headerImageView?.image = UIImage(named: "TwitterScrollBG")
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
//        header.insertSubview(headerImageView, belowSubview: headerLabel)
        
        // Header - Blurred Image
        
        headerBlurImageView = UIImageView(frame: header.bounds)
        headerBlurImageView?.image = UIImage(named: "TwitterScrollBG")?.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor())
        headerBlurImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        headerBlurImageView?.alpha = 0.0
 //       header.insertSubview(headerBlurImageView, belowSubview: headerLabel)
        
        header.clipsToBounds = true
         
         */

        
        
        twitterTableView.reloadData()
        
    }
    

}
extension PizzaViewController: MBTwitterScrollDelegate, UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
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
        
        return sectionHeaderTitleArray.count
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
           
        case .CreateYourOwn:
            item = itemManager.cyoPizzaItemAtIndex(indexPath.row)
          
            
        case .Speciality:
           item = itemManager.specialityPizzaItemAtIndex(indexPath.row)
            
        case .Calzones:
            item = itemManager.calzonesItemAtIndex(indexPath.row)
            
        case .Knots:
            item = itemManager.knotsItemAtIndex(indexPath.row)
            
            
        case .Salads:
            item = itemManager.saladItemAtIndex(indexPath.row)
        case .Drinks:
            item = itemManager.drinkItemAtIndex(indexPath.row)
            
            
        case .Dessert:
            item = itemManager.dessertItemAtIndex(indexPath.row)
            

        
            
        }
        cell!.configCellWithItem(item)

              return cell!
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        /*
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 120))
        
        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
 */
        
        
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
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    
   
    /*
     func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        
        
        return sectionHeaderTitleArray
    }
 */
    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
       
        
//        // Get Cell Label
//        let indexPath = tableView.indexPathForSelectedRow!
//        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! PizzaCell
//        
      //  valueToPass = currentCell.textLabel.text
        
      //  performSegueWithIdentifier("addToCart", sender: self)
    }
    

    
    
    
    
}
