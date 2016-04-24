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
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MenuTableViewController") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("LeftMenuTableViewController") {
            self.leftViewController = controller
        }
        SlideMenuOptions.leftViewWidth = 100
        SlideMenuOptions.contentViewScale = 100
        super.awakeFromNib()
    }
    

    override func viewDidLoad() {
        navView()
        super.viewDidLoad()
        title = "Simply Delicious"
        
        self.addLeftBarButtonWithImage(UIImage(named: "menuIconSmall")!)
//        if self.slideMenuController() != nil {
//            self.slideMenuController()?.openLeft()
//        }
        //create a new button
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        //set image for button
        button.setImage(UIImage(named: "shoppingCart"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action:#selector(ContainerViewController.shoppingCartButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(0, 0, 53, 53)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func navView(){
        
        let titleView = UIView(frame: CGRectMake(0.0, 0.0, 80.0, 40.0))
        
        titleView.backgroundColor = UIColor.clearColor()
        
       
        let imageView = UIImageView(image: UIImage(named: "120x120"))
        imageView.contentMode = UIViewContentMode.Center
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2
        imageView.layer.masksToBounds = true
        
        let titleLabel = UILabel()
        
        
       
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.redColor()
        titleLabel.text = "My Title Label"
        titleLabel.sizeToFit()
        
        
        titleView.addSubview(imageView)
     //   titleView.addSubview(titleLabel)
        
        self.navigationItem.titleView = titleView;
        
        
        
    }
    
    func shoppingCartButtonPressed(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC =  storyboard.instantiateViewControllerWithIdentifier("ShoppingCartViewController") as! ShoppingCartViewController
        self.presentViewController(mainVC, animated: true, completion: nil)
 
        
        
        
    }
    
   

    
}
