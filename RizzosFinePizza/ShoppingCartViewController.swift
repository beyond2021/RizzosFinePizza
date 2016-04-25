//
//  ShoppingCartViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/24/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol ShoppingCartViewControllerDelegate : class{
    func dismissShoppingCart()
}

class ShoppingCartViewController: UIViewController {
    weak var delegate : ShoppingCartViewControllerDelegate?
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getParticulars()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getParticulars(){
        let accessToken = FBSDKAccessToken.currentAccessToken()
        if(accessToken != nil) //should be != nil
        {
            print(accessToken.tokenString)
        }
        
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result["id"])")
                
                
                if let idLabelText = result["id"] as? String {
                    self.idLabel.text = idLabelText
                } else {
                    self.idLabel.text = "Unavailable"
                }
                if let emailLabelText = result["email"] as? String {
                    self.emailLabel.text = emailLabelText
                } else {
                    self.emailLabel.text = "Unavailable"
                }
                if let nameLabelText = result["name"] as? String {
                    self.nameLabel.text = nameLabelText
                } else {
                    self.nameLabel.text = "Unavailable"
                }
                
                            }
            else
            {
                print("error \(error)")
            }
        })
        
        
    }
    
    @IBAction func dismissAction(sender: UIButton) {
        self.delegate?.dismissShoppingCart()
//        let presentingViewController: UIViewController! = self.presentingViewController
//        
//        self.dismissViewControllerAnimated(false) {
//            // go back to MainMenuView as the eyes of the user
//            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
//        }
    }
    
    
}
