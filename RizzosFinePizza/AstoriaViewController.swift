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
    
    //MARK : Actions
    @IBAction func backToMain(sender: UIButton) {
        self.delegate?.dismissAstoria()
    }
    
    @IBAction func deliveryAction(sender: UIButton) {
        showMenu()
    }
    
    @IBAction func pickupAction(sender: UIButton) {
        showMenu()
    }
    
    @IBAction func callAstoriaAction(sender: UIButton) {
       UIApplication.sharedApplication().openURL(NSURL(string: "tel://7187219862")!)
//        if let url = NSURL(string: "tel://\(7187219862)") {
//            UIApplication.sharedApplication().openURL(url)
//        }
    }
    
    
    /*
     /Users/keevinmitchell/Desktop/RFP/RizzosFinePizza/RizzosFinePizza/AstoriaViewController.swift:88:45: Integer literal '7187219862' overflows when stored into 'Int'
 
 */

    
    
    
    

}
