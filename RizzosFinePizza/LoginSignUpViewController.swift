//
//  LoginSignUpViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/26/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class LoginSignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginBitton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        LoginService.sharedInstance.loginWithCompletionHandler(username!, password: password!) { (error) -> Void in
            
            if ((error) != nil) {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let alert = UIAlertController(title: "Why are you doing this to me?!?", message: error, preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                })
                
            } else {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let controllerId = LoginService.sharedInstance.isLoggedIn() ? "Welcome" : "Login";
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let initViewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier(controllerId) as UIViewController
                    self.presentViewController(initViewController, animated: true, completion: nil)
                })
            }
        }
    }

    }

  