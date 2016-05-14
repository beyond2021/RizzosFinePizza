//
//  PrepareForCartTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/11/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol PrepareForCartTableViewControllerDelegate : class{
    // ALL CLASS THAT CONFORM TO THIS PROTOCOL MUST IMPLEMENT
    func dissmissWithUpdatedOptions(updatedFoodItems:FoodItem?)
}


class PrepareForCartTableViewController: UITableViewController {
    //----------------------------------------------------------------------------------------------------------
    weak var delegate : PrepareForCartTableViewControllerDelegate?
    //----------------------------------------------------------------------------------------------------------
    @IBOutlet weak var foodTitleLable: UILabel!
    
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    @IBOutlet weak var totalPriceForCart: UILabel!
    
    @IBOutlet weak var personalRoundPriceLabel: UILabel!
    
    @IBOutlet weak var largeRoundPriceLabel: UILabel!
    
    @IBOutlet weak var largeSquarePriceChoiceLabel: UILabel!
    
    @IBAction func sauceAction(sender: UIButton) {
    }
    
    @IBAction func toppingsAction(sender: AnyObject) {
    }
    
    @IBAction func cheeseAction(sender: UIButton) {
    }
    
    
    @IBAction func stepperAction(sender: UIStepper) {
        numberOfOrdersLabel.text = Int(sender.value).description
//        totalPrice = totalPrice * Double(sender.value)
//        updatePrice(totalPrice)
    }
    
    
    @IBOutlet weak var numberOfOrdersLabel: UILabel!
    
    @IBOutlet weak var addToCartButtonLabel: UIButton!
    
    @IBAction func addToCartAction(sender: UIButton) {
        readyForCart = FoodItem(title: foodItem!.title, itemDescription: foodItem!.itemDescription, originalPrice: [totalPrice])
        
        let alert = UIAlertController(title: "Order Placed!", message: "Thank you for your order.\nWe'll delivery it to you soon!", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            (_)in
            self.performSegueWithIdentifier("unwindToMenu", sender: self)
        })
        
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        self.delegate?.dissmissWithUpdatedOptions(readyForCart)
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
      func configureView() {
     //   totalPriceForCart.text = "\(0)"
        // Update the user interface for the detail item.
        if let detail = self.foodItem {
            if let label = self.foodTitleLable {
                label.text = detail.title
            }
            if let label = self.foodDescriptionLabel{
                label.text = detail.itemDescription
            }
            if let price = (foodItem?.originalPrice){
                if let label = self.personalRoundPriceLabel{
                    label.text = "$"+"\(price[0])"
                }
                if let label = self.largeRoundPriceLabel{
                    label.text = "$"+"\(price[1])"
                }
                if let label = self.largeSquarePriceChoiceLabel{
                    label.text = "$"+"\(price[2])"
                }
            }
        }
    }
    
//MARK: View LifeCycle
           override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
          }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    override func viewWillAppear(animated: Bool) {
        reset()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
             /// print("cell selected at row \(indexPath.row)")
        
        if indexPath.row == 2 {
            // if this row is picked first item price is sent
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            
            totalPrice = totalPrice + (foodItem?.originalPrice[0])!
            updatePrice(totalPrice)                    }
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
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
    
    func updatePrice(finalPrice : Double){
        
        if finalPrice == 0.00{
            reset()
        }
        totalPriceForCart.text = "$"+"\(finalPrice)"
        
    }
    //MARK: When the view loads Total Price for Cart = 0.00
    var totalPrice = 0.00{
        didSet{
            if totalPrice != 0.00 {
                stateOne()
                
            } else {
               
            }
           
        }
    }
    var numberOfOrders = 1
    // user then makes a selection
    //Item is then selected. total price is then updated
    
    
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
        
    }
    
}
