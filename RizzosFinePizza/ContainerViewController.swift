//
//  ContainerViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/22/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainerViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("FoodItemListTableViewController") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("LeftMenuTableViewController") {
            self.leftViewController = controller
        }
        SlideMenuOptions.leftViewWidth = 100
        SlideMenuOptions.contentViewScale = 100
        super.awakeFromNib()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //TI GET CALLED IF U CAUSE A SEGUE TO TRIGGER
        // CHECK THE ID OF THE SEGUE. THIS IS A PROPERTY OF THE SEGUE
        // GET THE DESTINATION VC
        if segue.identifier == "cart" {
            // We are on the right one so lets now get the destinationVC
            if let destVC = segue.destinationViewController as? CartTableViewController {
                // if this was possible then we want to ourself its delegate
               // destVC.delegate = self
                
            }
        }
 
    }
    

    override func viewDidLoad() {
        navView()
        super.viewDidLoad()
       // title = "Simply Delicious"
        
        self.addLeftBarButtonWithImage(UIImage(named: "menuIconSmall")!)
        self.navigationItem.title = "Simply Delicious"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(named: "codepath-logo"), forBarMetrics: .Default)
          //  navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
            
            
            
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
            shadow.shadowOffset = CGSizeMake(2, 2);
            shadow.shadowBlurRadius = 4;
            navigationBar.titleTextAttributes = [
                NSFontAttributeName : UIFont.boldSystemFontOfSize(22),
                NSForegroundColorAttributeName : UIColor(red: 0.5, green: 0.15, blue: 0.15, alpha: 0.8),
                NSShadowAttributeName : shadow
            ]
        }
//        let loginManager = FBSDKLoginManager()
//        loginManager.logOut()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func navView(){
        
        let titleView = UIView(frame: CGRectMake(0.0, 0.0, 100.0, 100.0))
        
        titleView.backgroundColor = UIColor.clearColor()
        
       
        let imageView = UIImageView(image: UIImage(named: "120x120"))
        let logoHomeButton = ACPButton(frame: CGRectMake(0.0, 0.0, 60.0, 60.0))
        logoHomeButton.contentMode = UIViewContentMode.Center
        logoHomeButton.layer.cornerRadius = logoHomeButton.bounds.size.width / 2
        logoHomeButton.layer.masksToBounds = true
        
        logoHomeButton.setStyleWithImage("120x120", highlightedImage: "120x120", disableImage: "120x120", andInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        logoHomeButton.addTarget(self, action: #selector(ContainerViewController.homePressed), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        imageView.contentMode = UIViewContentMode.Center
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2
        imageView.layer.masksToBounds = true
        
        logoHomeButton.center.x = titleView.center.x
        logoHomeButton.center.y = titleView.center.y
        let titleLabel = UILabel()
        
        
       
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.redColor()
        titleLabel.text = "My Title Label"
        titleLabel.sizeToFit()
        
        
     //   titleView.addSubview(imageView)
     //   titleView.addSubview(titleLabel)
        titleView.addSubview(logoHomeButton)
        
        self.navigationItem.titleView = titleView;
        
        
        
    }
    
//    func shoppingCartButtonPressed(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainVC =  storyboard.instantiateViewControllerWithIdentifier("ShoppingCartViewController") as! ShoppingCartViewController
//        self.presentViewController(mainVC, animated: true, completion: nil)
// 
//        
//        
//        
//    }
    
    func dismissShoppingCart(){
        print("\(#function)")
        self.dismissViewControllerAnimated(true) {
            print("Shopping cart is dismissed")
        }
    }
    
    func homePressed(){
        
        
    }


    
}
