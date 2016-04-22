//
//  UESViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol UESViewControllerDelegate : class{
    // ALL CLASS THAT CONFORM TO THIS PROTOCOL MUST IMPLEMENT
    func dismissUES()
}



class UESViewController: UIViewController {
    
    weak var delegate : UESViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        

       
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
            self.calzonesAction()
        }
        
        menuView.addMenuItemWithTitle("Knots", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        menuView.addMenuItemWithTitle("Salads", andIcon: UIImage(named:"Calzones")) {
            self.calzonesAction()
        }
        menuView.addMenuItemWithTitle("Drinks", andIcon: UIImage(named:"Calzones")) {
            self.pizzaAction()
        }
        
        menuView.addMenuItemWithTitle("Dessert", andIcon: UIImage(named:"Calzones")) {
            self.calzonesAction()
        }
        
        
        menuView.show()

        
            }
    
    func pizzaAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc =  storyboard.instantiateViewControllerWithIdentifier("MenuTableViewController") as! MenuTableViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
        
        
    }
    func calzonesAction(){
        
    }
    
    @IBAction func backToMain(sender: UIButton) {
        self.delegate?.dismissUES()
    }

    
    @IBAction func pickupAction(sender: UIButton) {
        showMenu()
    }

    @IBAction func deliveryAction(sender: UIButton) {
        showMenu()
    }
    
    
    @IBAction func callUpperEastSide(sender: UIButton) {
        if let url = NSURL(string: "tel://\(2122890500)") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
