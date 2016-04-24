//
//  MainViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UESViewControllerDelegate, AstoriaViewControllerDelegate, LesViewControllerDelegate {
      
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var uesButton: UIButton!
    @IBOutlet weak var steinwayButton: UIButton!
    
    @IBOutlet weak var lesButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUpInterface()
        
        
        /*
        // for normal state
        uesButton.setImage(UIImage(named: "UESButton"), forState: UIControlState.Normal)
        // for Highlighted state
        uesButton.setImage(UIImage(named: "yyy.png"), forState: UIControlState.Highlighted)
        
        // for Selected state
        uesButton.setImage(UIImage(named: "UESButton"), forState: UIControlState.Selected)
        // Do any additional setup after loading the view.
 */
 
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bgImageView.alpha = 0
        //
        animate()
        
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

    @IBAction func loginButtonActgion(sender: UIButton) {
    }

    @IBAction func signUpButtonAction(sender: UIButton) {
    }
      
}
