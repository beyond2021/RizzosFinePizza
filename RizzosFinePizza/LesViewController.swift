//
//  LesViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol LesViewControllerDelegate : class {
    func dismissClinton()
}

class LesViewController: UIViewController {
    
    weak var delegate : LesViewControllerDelegate?
    
    @IBOutlet weak var homeButton: ACPButton!
    @IBOutlet weak var telepnoneButton: ACPButton!
    @IBOutlet weak var deliveryButton: ACPButton!

    @IBOutlet weak var pickupButton: ACPButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   deliveryButton.setFlatStyleType(style:ACPButtonBlue)
        /*
         - (void) setStyleType:(ACPButtonType)style;
         - (void) setFlatStyleType:(ACPButtonType)style;
         - (void) setFlatStyle:(UIColor*)normal andHighlightedColor:(UIColor*)highlight;
         - (void) setStyle:(UIColor*)topColor andBottomColor:(UIColor*)bottomColor;
         - (void) setStyleWithImage:(NSString*)image highlightedImage:(NSString*)hImage disableImage:(NSString *)dImage andInsets:(UIEdgeInsets)insets;
         - (void) setGlowHighlightedState:(BOOL)glowOption;
 
 */
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC =  storyboard.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
        let nav = UINavigationController(rootViewController: menuVC)
        self.presentViewController(nav, animated: true, completion: nil)

            }
    
    @IBAction func backToMain(sender: UIButton) {
        self.delegate?.dismissClinton()
    }
    
    @IBAction func deliveryAction(sender: UIButton) {
        showMenu()
    }
    
    @IBAction func pickupAction(sender: UIButton) {
        showMenu()
    }
    
    @IBAction func callClinton(sender: UIButton) {
      UIApplication.sharedApplication().openURL(NSURL(string: "tel://6464541262")!)
//        if let url = NSURL(string: "tel://\(6464541262)") {
//            UIApplication.sharedApplication().openURL(url)
//        }

        
    }
    
    

}
