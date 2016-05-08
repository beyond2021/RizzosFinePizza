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


class AstoriaViewController: UIViewController, PizzaViewControllerDelegate {
    weak var delegate : AstoriaViewControllerDelegate?
    
    @IBOutlet weak var telephoneButton: ACPButton!
    @IBOutlet weak var deliveryButton: ACPButton!
    @IBOutlet weak var homeButton: ACPButton!

    @IBOutlet weak var pickupButton: ACPButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pizzaVC = PizzaViewController()
        pizzaVC.delegate = self

        // Do any additional setup after loading the view.
        /*
         - (void) setStyleType:(ACPButtonType)style;
         - (void) setFlatStyleType:(ACPButtonType)style;
         - (void) setFlatStyle:(UIColor*)normal andHighlightedColor:(UIColor*)highlight;
         - (void) setStyle:(UIColor*)topColor andBottomColor:(UIColor*)bottomColor;
         - (void) setStyleWithImage:(NSString*)image highlightedImage:(NSString*)hImage disableImage:(NSString *)dImage andInsets:(UIEdgeInsets)insets;
         - (void) setGlowHighlightedState:(BOOL)glowOption;
 */
        deliveryButton.setStyle(UIColor(red:190.0/255.0, green: 126.0/255.0, blue: 96.0/255.0, alpha: 1.0), andBottomColor: UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0,alpha: 1.0))
        
        deliveryButton.setLabelTextColor( UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), highlightedColor: UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), disableColor: UIColor.lightGrayColor())
        //        telepnoneButton.setImage(UIImage(named: "phone"), forState: UIControlState.Normal)
        deliveryButton.setLabelFont(UIFont(name: "Trajan Pro Bold", size: 30))
        deliveryButton.titleLabel?.text = "Delivery"
        
        
        
        
//        telepnoneButton.setStyle(UIColor.clearColor(), andBottomColor: UIColor.clearColor())
//        homeButton.setStyle(UIColor.clearColor(), andBottomColor: UIColor.clearColor())
        
        pickupButton.setStyle(UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0,alpha: 1.0), andBottomColor: UIColor(red:190.0/255.0, green: 126.0/255.0, blue: 96.0/255.0, alpha: 1.0))
        
        pickupButton.setLabelTextColor( UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), highlightedColor: UIColor(red: 217.0/255.0, green: 207.0/255.0, blue: 120.0/255.0, alpha: 1.0), disableColor: UIColor.lightGrayColor())
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
        
        menuView.addMenuItemWithTitle("Pizza", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        
        menuView.addMenuItemWithTitle("Calzones", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        
        menuView.addMenuItemWithTitle("Knots", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Salads", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Drinks", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        
        menuView.addMenuItemWithTitle("Dessert", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        
        
        menuView.show()
        
        
    }
    
    func pizzaAction(){
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
       // showMenu()
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func pickupAction(sender: UIButton) {
       // showMenu()
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    
    @IBAction func callAstoriaAction(sender: UIButton) {
       UIApplication.sharedApplication().openURL(NSURL(string: "tel://7187219862")!)
    }
    
    // MARK:delegate Methods
    
    func dissmissPizza() {
   self.dismissViewControllerAnimated(true, completion: nil)    }
  
    
    
    
    

}
