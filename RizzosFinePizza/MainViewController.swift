//
//  MainViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/20/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
import pop
import UberRides
import CoreLocation


class MainViewController: UIViewController,  AstoriaViewControllerDelegate, LesViewControllerDelegate,FBLoginViewControllerDelegate,CLLocationManagerDelegate {
    // User Location
    var latitude : Double?
    var longitude : Double?
      
    @IBOutlet weak var bgImageView: UIImageView!
    
   
    @IBOutlet weak var steinwayButton: UIButton!
    
    @IBOutlet weak var lesButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var beyondLabel: UILabel!
    
   
    //Create a location Manager
    lazy var locationManager : CLLocationManager = {
        let loc = CLLocationManager()
        // Set up location manager with defaults
        loc.desiredAccuracy = kCLLocationAccuracyBest
        loc.distanceFilter = kCLDistanceFilterNone
        loc.delegate = self // Set ourself up for call backs(Delegate)
        
        //Optimization of battery
        loc.pausesLocationUpdatesAutomatically = true
        loc.activityType = CLActivityType.Fitness
        loc.allowsBackgroundLocationUpdates = false
        // All set up so we can now ask for permission
        
        return loc
        
    }()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
setupUber() 
        
        // locationManager.requestAlwaysAuthorization()
        
       
        
        
//        bgImageView.image = UIImage(named: "LocationsBGIT")
        setUpInterface()
                
        if (FBSDKAccessToken.currentAccessToken() != nil){
            lesButton.enabled = true
           
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
       
        steinwayButton.enabled = true
        beyondLabel.alpha = 0
        
        
        /*
        let loginManager = LoginManager()
        loginManager.login(requestedScopes:[.RideWidgets], presentingViewController: self, completion: { accessToken, error in
            // Completion block. If accessToken is non-nil, you’re good to go
            // Otherwise, error.code corresponds to the RidesAuthenticationErrorType that occured
        })
 */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Actions
    
   
    @IBAction func steinwayAction(sender: UIButton) {
        steinwayButton.center.x += view.bounds.width
        
    }
    @IBAction func lesButton(sender: UIButton) {
        lesButton.center.x += view.bounds.width
    }
    
    //MARK: - Interface
    func setUpInterface(){
        bgImageView.contentMode = UIViewContentMode.Center
        
        
        steinwayButton.layer.cornerRadius = steinwayButton.bounds.size.width / 2
        steinwayButton.layer.masksToBounds = true
        
        lesButton.layer.cornerRadius = lesButton.bounds.size.width / 2
        lesButton.layer.masksToBounds = true
        
    }
    func animate(){
   
        UIView.animateWithDuration(0.9, delay: 1.5, options: [], animations: {
            self.beyondLabel.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.9, delay: 20.5, options: [], animations: {
            self.beyondLabel.alpha = 0.0
            }, completion: nil)
        
        
        //
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {
            self.bgImageView.alpha = 1.0
            }, completion: nil)
        
        //START OFF THE SCREEN
               steinwayButton.center.x -= view.bounds.width
        lesButton.center.x -= view.bounds.width
        
        //Bring on screen
               
        
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
    
    func setupUber(){
        
        // If no pickup location is specified, the default is to use current location
        let parameters = RideParametersBuilder().build()
        // You can also explicitly the parameters to use current location
        let builder = RideParametersBuilder()
        builder.setPickupToCurrentLocation()
        // Use your_class as the delegate
        let behavior = RideRequestViewRequestingBehavior(presentingViewController: self)
        let delegate = MainViewController()
        behavior.modalRideRequestViewController.rideRequestViewController.delegate = delegate
        let button = RideRequestButton(rideParameters: parameters, requestingBehavior: behavior)
        //self.view.center.x = button.center.x
        button.center.x = view.center.x
        button.center.y = button.center.y + 60
        self.view.addSubview(button)
          }
    // MARK: - CLLocation Manager Delegate
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    /*
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        latitude = locValue.latitude
        longitude = locValue.longitude
    }
 */
    
    
    
   }
// Swift
extension MainViewController : RideRequestViewControllerDelegate {
    func rideRequestViewController(rideRequestViewController: RideRequestViewController, didReceiveError error: NSError) {
        let errorType = RideRequestViewErrorType(rawValue: error.code) ?? .Unknown
        // Handle error here
        switch errorType {
        case .AccessTokenMissing:
            let alert = UIAlertController(title: "Error! AccessTokenMissing", message: "Fix This Shit!!", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            presentViewController(alert, animated: true, completion: nil)

            
            
        // No AccessToken saved
        case .AccessTokenExpired:
        // AccessToken expired / invalid
            let alert = UIAlertController(title: "AccessToken expired / invalid", message: "Fix This Shit!!", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            presentViewController(alert, animated: true, completion: nil)

            
            
        case .NetworkError:
        // A network connectivity error
            let alert = UIAlertController(title: "Not Connected To The Network", message: "Log on to Wifi or some shit", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            presentViewController(alert, animated: true, completion: nil)
            
        case .NotSupported:
        // The attempted operation is not supported on the current device
            let alert = UIAlertController(title: "Operation Not Supported on this devbice", message: "Get An Iphone 6Plus fool!", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            presentViewController(alert, animated: true, completion: nil)
 
            
            
            
        case .Unknown:
            // Other error
                       let alert = UIAlertController(title: "Weird unknown error occured", message: "Try not to blow up ur phone", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(OKAction)
            presentViewController(alert, animated: true, completion: nil)

            
            
        }
    }
    
    
    func labelAction(){
        
        
    }
}

