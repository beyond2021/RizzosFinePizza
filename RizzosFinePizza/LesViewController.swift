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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//        if let url = NSURL(string: "tel://\(6464541262)") {
//            UIApplication.sharedApplication().openURL(url)
//        }

        
    }
    
    

}
