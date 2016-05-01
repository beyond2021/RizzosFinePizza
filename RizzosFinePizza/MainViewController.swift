//
//  MainViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
import pop


class MainViewController: UIViewController, UESViewControllerDelegate, AstoriaViewControllerDelegate, LesViewControllerDelegate,FBLoginViewControllerDelegate {
      
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var uesButton: UIButton!
    @IBOutlet weak var steinwayButton: UIButton!
    
    @IBOutlet weak var lesButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        bgImageView.image = UIImage(named: "LocationsBGIT")
        setUpInterface()
                
        if (FBSDKAccessToken.currentAccessToken() != nil){
            lesButton.enabled = true
            uesButton.enabled = true
            steinwayButton.enabled = true
            
        } else {
           
         //   loginAlert()

            
            
            
        }
        
//        if ([FBSDKAccessToken currentAccessToken]) {
//            // User is logged in
//            [self performSelector:@selector(accessGrantedNavigation)
//            withObject:nil afterDelay:0.0];
//        }
//        
//        -(void)accessGrantedNavigation{
//            [self performSegueWithIdentifier: @"segueLoginFB" sender: self];
//        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bgImageView.alpha = 0
        //
              
                  // here code perfomed with delay
            self.animate()
        
        
    }
    override func viewDidAppear(animated: Bool) {
        lesButton.enabled = true
        uesButton.enabled = true
        steinwayButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Actions
    
    @IBAction func uesAction(sender: UIButton) {
        uesButton.center.x += view.bounds.width
    }

    @IBAction func steinwayAction(sender: UIButton) {
        steinwayButton.center.x += view.bounds.width
        
    }
    @IBAction func lesButton(sender: UIButton) {
        lesButton.center.x += view.bounds.width
    }
    
    //MARK: - Interface
    func setUpInterface(){
        bgImageView.contentMode = UIViewContentMode.Center
        
        // bgImageView.image = UIImage(assetIdentifier: .BlankBG)
        // customImageView.layer.cornerRadius = customImageView.bounds.size.width / 2
        uesButton.layer.cornerRadius = uesButton.bounds.size.width / 2
        uesButton.layer.masksToBounds = true
        
        steinwayButton.layer.cornerRadius = steinwayButton.bounds.size.width / 2
        steinwayButton.layer.masksToBounds = true
        
        lesButton.layer.cornerRadius = lesButton.bounds.size.width / 2
        lesButton.layer.masksToBounds = true
        
    }
    func animate(){
   
//        let basicAnimation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
//        basicAnimation.toValue = NSValue(CGRect: CGRectMake(0, 0, 90, 190))
//        basicAnimation.name = "BigButtonPopAnimation"
//        basicAnimation.delegate = self
//        self.tableView.pop_addAnimation(basicAnimation["WhatEverNameYouWant"])
        
        
        
        //
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {
            self.bgImageView.alpha = 1.0
            }, completion: nil)
        
        //START OFF THE SCREEN
        uesButton.center.x -= view.bounds.width
        steinwayButton.center.x -= view.bounds.width
        lesButton.center.x -= view.bounds.width
        
        //Bring on screen
        UIView.animateWithDuration(0.73, delay: 0.0, usingSpringWithDamping:
            0.9, initialSpringVelocity: 0.0, options: [], animations: {
                self.uesButton.center.x += self.view.bounds.width
                
            }, completion: nil)
        UIView.animateWithDuration(0.73, delay: 0.5, usingSpringWithDamping:
            0.6, initialSpringVelocity: 0.0, options: [], animations: {
                self.steinwayButton.center.x += self.view.bounds.width
                
            }, completion: nil)
        UIView.animateWithDuration(0.73, delay: 0.7, usingSpringWithDamping:
            0.3, initialSpringVelocity: 0.0, options: [], animations: {
                self.lesButton.center.x += self.view.bounds.width
                
            }, completion: nil)
        
        
    }
    
    //MARK: - NAVIGATION
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TI GET CALLED IF U CAUSE A SEGUE TO TRIGGER
        // CHECK THE ID OF THE SEGUE. THIS IS A PROPERTY OF THE SEGUE
        // GET THE DESTINATION VC
        if segue.identifier == "UES" {
            // We are on the right one so lets now get the destinationVC
            if let destVC = segue.destinationViewController as? UESViewController {
                // if this was possible then we want to ourself its delegate
                destVC.delegate = self
                
            }
        }else
            if segue.identifier == "Astoria" {
                // We are on the right one so lets now get the destinationVC
                if let destVC = segue.destinationViewController as? AstoriaViewController {
                    // if this was possible then we want to ourself its delegate
                    destVC.delegate = self
                    
                }
            }else
                if segue.identifier == "Clinton" {
                    // We are on the right one so lets now get the destinationVC
                    if let destVC = segue.destinationViewController as? LesViewController {
                        // if this was possible then we want to ourself its delegate
                        destVC.delegate = self
                        
                    }
                }
    else
    if segue.identifier == "login" {
    // We are on the right one so lets now get the destinationVC
    if let destVC = segue.destinationViewController as? FBLoginViewController {
    // if this was possible then we want to ourself its delegate
    destVC.delegate = self
    
    }
    }

    
           }







    //MARK : Delegate Actions
    func dismissUES(){
       self.dismissViewControllerAnimated(true) {
        print("UES is dismissed")
        }
        
    }
    
        func dismissAstoria(){
            self.dismissViewControllerAnimated(true) {
                print("Astoria is dismissed")
            }
            
            
        }
    func dismissClinton(){
        self.dismissViewControllerAnimated(true) {
            print("Clinton is dismissed")
        }
        
        
    }
    func dismissfb(){
      self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func getLoginStatus(){
           }
    
    func loginAlert(){
        let alert = UIAlertController(title: "Please Log In Or Sign-Up", message: "We can serve you quicker if you are logged in.", preferredStyle: .Alert)
        let dismiss = UIAlertAction(title: "Thank You!", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(dismiss)
       presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func LogoutAction(sender: UIButton) {
        LoginService.sharedInstance.signOut()
        
        let controllerId = LoginService.sharedInstance.isLoggedIn() ? "Welcome" : "Login";
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initViewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier(controllerId) as UIViewController
        self.presentViewController(initViewController, animated: true, completion: nil)
    }
        
        
   

    @IBAction func loginButtonActgion(sender: UIButton) {
    }

    @IBAction func signUpButtonAction(sender: UIButton) {
    }
    
   }
