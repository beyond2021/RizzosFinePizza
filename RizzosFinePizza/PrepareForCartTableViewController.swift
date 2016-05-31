//
//  PrepareForCartTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
enum DeliveryStatus : String {
    case Deliver = "Delivery"
    case PickUp = "Pick-Up"
    case None = ""
}
var dt = DeliveryStatus.None.rawValue

enum StoreLocation : String {
    case Les
    case Astoria
    case None = ""
}
var sl = StoreLocation.None.rawValue

protocol PrepareForCartTableViewControllerDelegate : class{
    // ALL CLASS THAT CONFORM TO THIS PROTOCOL MUST IMPLEMENT
    func dissmissWithUpdatedOptions(updatedFoodItems:FoodItem?)
}


class PrepareForCartTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    //----------------------------------------------------------------------------------------------------------
    weak var delegate : PrepareForCartTableViewControllerDelegate?
    //----------------------------------------------------------------------------------------------------------
    @IBOutlet weak var foodTitleLable: UILabel!
    
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    @IBOutlet weak var totalPriceForCart: UILabel!
    
    @IBOutlet weak var personalRoundPriceLabel: UILabel!
    
    @IBOutlet weak var largeRoundPriceLabel: UILabel!
    
    @IBOutlet weak var largeSquarePriceChoiceLabel: UILabel!
    
    @IBOutlet weak var dtImageView: UIImageView!
    
    
    @IBOutlet weak var proundLabel: UILabel!
    
    @IBOutlet weak var lroundLabel: UILabel!
    
    @IBOutlet weak var lsquareLabel: UILabel!
    
    @IBAction func sauceAction(sender: AnyObject) {
        showExtraSauce()
        /*
        let popoverContent = self.storyboard?.instantiateViewControllerWithIdentifier("SauceVC") as! SauceViewController
        
        popoverContent.modalPresentationStyle = .Popover
        _ = popoverContent.popoverPresentationController
        
        if let popover = popoverContent.popoverPresentationController {
            
            let viewForSource = sender as! UIView
            popover.sourceView = viewForSource
            
            // the position of the popover where it's showed
            popover.sourceRect = viewForSource.bounds
            
            // the size you want to display
            popoverContent.preferredContentSize = CGSizeMake(200,500)
            popover.delegate = self
        }            
        
        self.presentViewController(popoverContent, animated: true, completion: nil)
 */
        
    }
    
    @IBAction func toppingsAction(sender: AnyObject) {
        showToppings()
    }
    
    @IBAction func cheeseAction(sender: UIButton) {
        showCheezeToppings()
    }
    
    
    @IBAction func stepperAction(sender: UIStepper) {
        numberOfOrdersLabel.text = Int(sender.value).description
        numberOfOrders = Int(sender.value)
       // totalPrice = originalPrice * Double(sender.value)
        
       // totalPrice = totalPrice * Double(sender.value)
        updatePrice(totalPrice)
    }
    
    
    @IBOutlet weak var numberOfOrdersLabel: UILabel!
    
    @IBOutlet weak var addToCartButtonLabel: UIButton!
    
    @IBAction func addToCartAction(sender: UIButton) {
        if let detail = self.foodItem {
            let alert = UIAlertController(title: "\(numberOfOrders) \(detail.title). \nTotal: $\(totalPrice).\nOrder Placed!", message: "Thank you for your order.\nWe'll delivery it to you soon!", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
                (_)in
                self.performSegueWithIdentifier("unwindToMenu", sender: self)
            })
            alert.addAction(OKAction)
            pointVariable = 0
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
        
            readyForCart = FoodItem(title: foodItem!.title, itemDescription: foodItem!.itemDescription, originalPrice: [totalPrice])
        
//        let alert = UIAlertController(title: "\(numberOfOrders) Order Placed!", message: "Thank you for your order.\nWe'll delivery it to you soon!", preferredStyle: .Alert)
//        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
//            (_)in
//           self.performSegueWithIdentifier("unwindToMenu", sender: self)
//        })
        
       // alert.addAction(OKAction)
        //pointVariable = 0
      //  self.presentViewController(alert, animated: true, completion: nil)
        
        
        //self.delegate?.dissmissWithUpdatedOptions(readyForCart)
    }
    
    @IBOutlet weak var firstLabel: UILabel!
    
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    @IBOutlet weak var firstCell: UITableViewCell!
    
    @IBOutlet weak var secondCell: UITableViewCell!
    
    
    @IBOutlet weak var thirdCell: UITableViewCell!
    
    @IBOutlet weak var stepperButton: UIStepper!
    
    @IBOutlet weak var sauceButton: UIButton!
    
    @IBOutlet weak var toppingsButton: UIButton!
    
    @IBOutlet weak var cheeseButton: UIButton!
    
    
    var readyForCart : FoodItem?
    
    var foodItem : FoodItem? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    
    //MARK: Our View
    func configureView() {
      //  setupRightBarButtonItem()
        //   totalPriceForCart.text = "\(0)"
        // Update the user interface for the detail item.
        if let detail = self.foodItem {
            if let label = self.foodTitleLable {
                label.text = detail.title
            }
            if let label = self.foodDescriptionLabel{
                label.text = detail.itemDescription
            }
            
           /*
             let personalRDoriginalPriceText = "\(foodItem?.originalPrice[0])"
             let pPrice = decimalWithString(personalRDoriginalPriceText)
             self.personalRoundPriceLabel.text =  "$"+"\(pPrice)"
             //
             let largeRDoriginalPriceText = "\(foodItem?.originalPrice[1])"
             let lrPrice = decimalWithString(largeRDoriginalPriceText)
             self.personalRoundPriceLabel.text =  "$"+"\(lrPrice)"
             //
             let largeSQOriginalPriceText = "\(foodItem?.originalPrice[2])"
             let lsPrice = decimalWithString(largeSQOriginalPriceText)
             self.personalRoundPriceLabel.text =  "$"+"\(lsPrice)"
             //
            // String(format: "%.2f", (Zahl / 95) * 100)
 */
             
            
           
            if let price = (foodItem?.originalPrice){
                if let label = self.personalRoundPriceLabel{
                    //let s = "\(price[0])"
                    let s = String(format: "%.2f", price[0])
                    let d = self.decimalWithString(s)
                    label.text = "$"+"\(d)"
                }
                if let label = self.largeRoundPriceLabel{
                    // label.text = "$"+"\(price[1])"
                    let s = "\(price[1])"
                    let d = self.decimalWithString(s)
                    label.text = "$"+"\(d)"
                }
                if let label = self.largeSquarePriceChoiceLabel{
                    // label.text = "$"+"\(price[2])"
                    let s = "\(price[2])"
                    let d = self.decimalWithString(s)
                    label.text = "$"+"\(d)"
                }
            } 
 }
    }
    
//MARK: View LifeCycle
    override func awakeFromNib() {
      //  setupRightBarButtonItem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBB : UIBarButtonItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: nil)
        rightBB.setBackgroundImage(UIImage(named: "shoppingCart"), forState: UIControlState.Normal, style: UIBarButtonItemStyle.Done, barMetrics: UIBarMetrics.Default)
        self.navigationItem.rightBarButtonItem = rightBB
        
       self.configureView()
        title = dt
        
        self.configureView()
        if pointVariable >= 3{
            disableButtons()
        }
        if pointVariable >= 6{
            drinksDessertAction()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if pointVariable < 3 {
            resetLabels()
        }
        setUpSiri()
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        //        readyForCart = nil
        resetLabels()
        //   pointVariable = 0
      //  setupRightBarButtonItem()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        updateImage()
        reset()
    }
    
    
    
    //MARK:  Item Selection
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
             /// print("cell selected at row \(indexPath.row)")
        
        if indexPath.row == 2 {
            
            // if this row is picked first item price is sent
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            
            totalPrice = totalPrice + (foodItem?.originalPrice[0])!
            updatePrice(totalPrice)
            if pointVariable >= 6{
                self.drinksDessertAction()
            }
        
        
        
        }
        if indexPath.row == 3 {
            
            
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
           totalPrice = totalPrice + (foodItem?.originalPrice[1])!
            updatePrice(totalPrice)
        }
        if indexPath.row == 4 {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            
          totalPrice = totalPrice + (foodItem?.originalPrice[2])!
            updatePrice(totalPrice)
        }
        }
    
    //MARK:  Item Deselection
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //
        if indexPath.row == 2 {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            if totalPrice != 0{
                totalPrice = totalPrice - (foodItem?.originalPrice[0])!
                updatePrice(totalPrice)
                updateCount()
            } else {
                reset()
            }
        }
        //
        if indexPath.row == 3 {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            if totalPrice != 0{
                totalPrice = totalPrice - (foodItem?.originalPrice[1])!
                updatePrice(totalPrice)
                updateCount()
            } else {
                reset()
            }
        }
        //
        if indexPath.row == 4 {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            if totalPrice != 0{
                totalPrice = totalPrice - (foodItem?.originalPrice[2])!
                updatePrice(totalPrice)
                updateCount()
            } else {
                reset()
            }
        }
    }
    
    
    
    //MARK:  Price
    var originalPrice : Double?
    
    func updatePrice(finalPrice : Double){
                if finalPrice == 0.00{
            reset()
        }
        let sp  = "\(finalPrice)"
        let dp =  decimalWithString(sp)
                totalPriceForCart.text = "$"+"\(dp)"
        
    }
    //MARK: Total Price
    var totalPrice = 0.00{
        didSet{
            if totalPrice != 0.00 {
                stateOne()
            } else {
            }
        }
    }
    
     //MARK: Number Of Orders
    var numberOfOrders = 1
    
    //MARK: - Reset State
    
    func reset(){
        readyForCart = nil
        totalPrice = 0.00 // Scene opens with total price = 0
        numberOfOrders = 1
        cheeseButton.enabled = false
        cheeseButton.alpha = 0.3
        toppingsButton.enabled = false
        toppingsButton.alpha = 0.3
        sauceButton.enabled = false
        sauceButton.alpha = 0.3
        stepperButton.enabled = false
        stepperButton.alpha = 0.3
        addToCartButtonLabel.enabled = false
        addToCartButtonLabel.alpha = 0.3
    }
    
    //MARK: - Selected State
    func stateOne(){
        // Update the label with the total price
        cheeseButton.enabled = true
        cheeseButton.alpha = 1
        toppingsButton.enabled = true
        toppingsButton.alpha = 1
        sauceButton.enabled = true
        sauceButton.alpha = 1
        stepperButton.enabled = true
        stepperButton.alpha = 1
        addToCartButtonLabel.enabled = true
        addToCartButtonLabel.alpha = 1
        if tableView.indexPathsForSelectedRows!.count != 1 {
            stepperButton.enabled = false
            stepperButton.alpha = 0.3
        } else if tableView.indexPathsForSelectedRows!.count == 0
        {
            reset()
        }
    }
    
    func updateCount(){
        if let list = tableView.indexPathsForSelectedRows {
            print(list.count)
        }
    }
    
    deinit{
   readyForCart = nil
        resetLabels()
        
    }
    //MARK: Popover delegate method
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    //MARK: - Not Pizza State
    func disableButtons(){
        lroundLabel.alpha = 0.0
        lsquareLabel.alpha = 0.0
        largeRoundPriceLabel.alpha = 0.0
        largeSquarePriceChoiceLabel.alpha = 0.0
        if let detail = self.foodItem {
            proundLabel.text  = detail.title
        }
    }
    
    //MARK: - Pizza State
    func resetLabels(){
        lroundLabel.alpha = 1.0
        lsquareLabel.alpha = 1.0
        largeRoundPriceLabel.alpha = 1.0
        largeSquarePriceChoiceLabel.alpha = 1.0
        proundLabel.text  = "Personal RD"
        
    }
    //MARK: - Drinks State
    
    func drinksDessertAction(){
        cheeseButton.enabled = false
        cheeseButton.alpha = 0.0
        toppingsButton.enabled = false
        toppingsButton.alpha = 0.0
        sauceButton.enabled = false
        sauceButton.alpha = 0.0

    }
    
    //MARK: - NSDecimal Number Converter
    
    func decimalWithString(string: String) -> NSDecimalNumber {
        let formatter = NSNumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2        
        return formatter.numberFromString(string) as? NSDecimalNumber ?? 0
    }
    
    func updateImage(){
        switch pointVariable{
        case 0:
            self.dtImageView.image = UIImage(named: "dtPizza")
        case 1:
            self.dtImageView.image = UIImage(named: "dtPizza")
        case 2:
            self.dtImageView.image = UIImage(named: "dtPizza")
        case 3:
            self.dtImageView.image = UIImage(named: "dtCalzones")
        case 4:
            self.dtImageView.image = UIImage(named: "dtKnots")
        case 5:
            self.dtImageView.image = UIImage(named: "dtSalad")
        case 6:
            self.dtImageView.image = UIImage(named: "dtDrinks")
        case 7:
            self.dtImageView.image = UIImage(named: "dtDessert")
            drinksDessertAction()
        default:
            self.dtImageView.image = UIImage(named: "TwitterScrollBG")
            
        }
          }
    //MARK: Stepper
    
    func turnOnStepper(){
        stepperButton.enabled = true
        stepperButton.alpha = 1.0
       }
    func turnOffStepper(){
        stepperButton.enabled = false
        stepperButton.alpha = 0.3
    }
    //MARK: - Toppings
    func showToppings(){
        let menuView = CHTumblrMenuView()
        
        menuView.addMenuItemWithTitle("Pepperon", andIcon: UIImage(named:"pizza")) {
           // self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Eggplant Cutlet", andIcon: UIImage(named:"calzone")) {
           // self.calzoneAction()
        }
        
        menuView.addMenuItemWithTitle("Fresh Pepper", andIcon: UIImage(named:"knots")) {
          ///  self.knotsAction()
        }
        
        menuView.addMenuItemWithTitle("Fresh Pepper", andIcon: UIImage(named:"salad")) {
           // self.saladAction()
        }
        menuView.addMenuItemWithTitle("Onion", andIcon: UIImage(named:"coke")) {
           // self.drinkAction()
        }
        
        menuView.addMenuItemWithTitle("Tomato", andIcon: UIImage(named:"dessert")) {
           // self.dessertAction()
        }
        
        //
        menuView.addMenuItemWithTitle("Pepperon", andIcon: UIImage(named:"pizza")) {
            // self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Eggplant Cutlet", andIcon: UIImage(named:"calzone")) {
            // self.calzoneAction()
        }
        
        menuView.addMenuItemWithTitle("Fresh Pepper", andIcon: UIImage(named:"knots")) {
            ///  self.knotsAction()
        }
        
        menuView.addMenuItemWithTitle("Fresh Pepper", andIcon: UIImage(named:"salad")) {
            // self.saladAction()
        }
        menuView.addMenuItemWithTitle("Onion", andIcon: UIImage(named:"coke")) {
            // self.drinkAction()
        }
        
        menuView.addMenuItemWithTitle("Tomato", andIcon: UIImage(named:"dessert")) {
            // self.dessertAction()
        }
        
        
        
        
        
        menuView.show()
        
        
    }
    func showCheezeToppings(){
        let menuView = CHTumblrMenuView()
        
        menuView.addMenuItemWithTitle("Ricotta", andIcon: UIImage(named:"pizza")) {
            // self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Parmigiano", andIcon: UIImage(named:"calzone")) {
            // self.calzoneAction()
        }
        
        menuView.addMenuItemWithTitle("Mozzarella", andIcon: UIImage(named:"knots")) {
            ///  self.knotsAction()
        }
        
        menuView.addMenuItemWithTitle("Parmigiano", andIcon: UIImage(named:"salad")) {
            // self.saladAction()
        }
        menuView.addMenuItemWithTitle("Romano", andIcon: UIImage(named:"coke")) {
            // self.drinkAction()
        }
        
        menuView.addMenuItemWithTitle("Cheese", andIcon: UIImage(named:"dessert")) {
            // self.dessertAction()
        }
        
        
        menuView.show()

        
        
    }
    func showExtraSauce(){
        let menuView = CHTumblrMenuView()
        
        menuView.addMenuItemWithTitle("Extra Sauce", andIcon: UIImage(named:"pizza")) {
            // self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Side of Hot Sauce", andIcon: UIImage(named:"calzone")) {
            // self.calzoneAction()
        }
        
        menuView.addMenuItemWithTitle("BBQ", andIcon: UIImage(named:"knots")) {
            ///  self.knotsAction()
        }
        
        menuView.addMenuItemWithTitle("Side of Basil Pesto", andIcon: UIImage(named:"salad")) {
            // self.saladAction()
        }
        
        
        menuView.show()
        
    }
    func showSaladDressing(){
        let menuView = CHTumblrMenuView()
        
        menuView.addMenuItemWithTitle("Herbed Vinaigrette", andIcon: UIImage(named:"pizza")) {
            // self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Herbed Vinaigrette", andIcon: UIImage(named:"calzone")) {
            // self.calzoneAction()
        }
        
        
        menuView.show()
        
    }
    //MARK:- Floating Buttons
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
        floatingSiriButton.frame = CGRectMake(0, 60, 80, 80)
        
       // tableView.addSubview(floatingSiriButton)
        
        dtImageView.addSubview(floatingSiriButton)
       
        self.view.insertSubview(floatingSiriButton, aboveSubview: dtImageView)
            }
    
    func siriPressed(){
        
       let alert = UIAlertController(title: "Siri Pressed", message: nil, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
         alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func cartAction(sender: UIButton) {
       
            let alert = UIAlertController(title: "Your Cart is empty!!", message: "Please fill it up.\nThank You!", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            pointVariable = 0
            self.presentViewController(alert, animated: true, completion: nil)
            
      

    }
    
    
    
}
