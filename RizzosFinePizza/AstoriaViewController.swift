//
//  AstoriaViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol AstoriaViewControllerDelegate : class{
    // ALL CLASS THAT CONFORM TO THIS PROTOCOL MUST IMPLEMENT
    func dismissAstoria()
}


class AstoriaViewController: UIViewController {
    weak var delegate : AstoriaViewControllerDelegate?
    
    @IBOutlet weak var telephoneButton: ACPButton!
    @IBOutlet weak var deliveryButton: ACPButton!
    @IBOutlet weak var homeButton: ACPButton!

    @IBOutlet weak var pickupButton: ACPButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
                deliveryButton.setStyle(UIColor(red:190.0/255.0, green: 126.0/255.0, blue: 96.0/255.0, alpha: 1.0), andBottomColor: UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0,alpha: 1.0))
        pickupButton.setStyle(UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0,alpha: 1.0), andBottomColor: UIColor(red:190.0/255.0, green: 126.0/255.0, blue: 96.0/255.0, alpha: 1.0))
        
        
        
        
        deliveryButton.setLabelTextColor(UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), highlightedColor: UIColor.whiteColor(), disableColor: UIColor.lightGrayColor())
        pickupButton.setLabelTextColor( UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), highlightedColor: UIColor.whiteColor(), disableColor: UIColor.lightGrayColor())
        
        
        
        deliveryButton.setLabelFont(UIFont(name: "Trajan Pro Bold", size: 30))
        deliveryButton.titleLabel?.text = "Delivery"
        
              
        
        
        pickupButton.setLabelFont(UIFont(name: "vermin_vibes", size: 30))
        //Trajan Pro Bold 30.0
        
        
        
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showMenu(){
        let menuView = CHTumblrMenuView()
        
        menuView.addMenuItemWithTitle("Pizza", andIcon: UIImage(named:"pizza")) {
            self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Calzones", andIcon: UIImage(named:"calzone")) {
            self.calzoneAction()
        }
        
        menuView.addMenuItemWithTitle("Knots", andIcon: UIImage(named:"knots")) {
            self.knotsAction()
        }
        
        menuView.addMenuItemWithTitle("Salads", andIcon: UIImage(named:"salad")) {
            self.saladAction()
        }
        menuView.addMenuItemWithTitle("Drinks", andIcon: UIImage(named:"coke")) {
            self.drinkAction()
        }
        
        menuView.addMenuItemWithTitle("Dessert", andIcon: UIImage(named:"dessert")) {
            self.dessertAction()
        }
        
        
        menuView.show()
        
        
    }
    
    func pizzaAction(){
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    func calzoneAction(){
        
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        pointVariable = 3
        
        let nav = UINavigationController(rootViewController: menuVC)
        
        self.presentViewController(nav, animated: true, completion: nil)
        
        
    }
    func knotsAction(){
        pointVariable = 4
        
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    func saladAction(){
        pointVariable = 5
        
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
        
    }
    func drinkAction(){
        pointVariable = 6
        
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    func dessertAction(){
        pointVariable = 7
        
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
        
    }


    
    
    //MARK : Actions
    @IBAction func backToMain(sender: UIButton) {
        self.delegate?.dismissAstoria()
    }
    
    @IBAction func deliveryAction(sender: UIButton) {
        showMenu()
        /**
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
 */
        
        
        
    }
    
    @IBAction func pickupAction(sender: UIButton) {
        showMenu()
        /**
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
 */
        
    }
    
    @IBAction func callAstoriaAction(sender: UIButton) {
       UIApplication.sharedApplication().openURL(NSURL(string: "tel://7187219862")!)
    }
    
    // MARK:delegate Methods
    
    func dissmissPizza() {
   self.dismissViewControllerAnimated(true, completion: nil)    }
  
    
    
    
    

}
