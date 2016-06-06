//
//  LeftMenuTableViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/22/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
import Social
import FBSDKLoginKit
import CoreLocation
import UberRides
import AWSMobileHubHelper

class LeftMenuTableViewController: UITableViewController, TrackViewControllerDelegate, CLLocationManagerDelegate {
    
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
        
    }
    
    //MARK:- Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TI GET CALLED IF U CAUSE A SEGUE TO TRIGGER
        // CHECK THE ID OF THE SEGUE. THIS IS A PROPERTY OF THE SEGUE
        // GET THE DESTINATION VC
        if segue.identifier == "track" {
            // We are on the right one so lets now get the destinationVC
            if let destVC = segue.destinationViewController as? TrackViewController {
                // if this was possible then we want to ourself its delegate
                destVC.delegate = self
            }
        }
    }
 
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     //MARK:- Delegate Methods
   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row{
        case 0:
            goBackToMain()
        case 1:
            facebook()
        case 2:
            twitter()
        case 3:
            performSegueWithIdentifier("track", sender: self)
        case 4:
            // uber()
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
            self.view.addSubview(button)
        case 5:
            logOut()
        default : break
        }
    }
    //MARK:- TrackViewController Delegate
    func dismissTrack(){
        self.dismissViewControllerAnimated(true) {
            print("Clinton is dismissed")
        }
    }

    
    func goBackToMain(){
        self.performSegueWithIdentifier("main", sender: self)
    }
    
    //MARK:- FaceBook
    func facebook(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            self.presentViewController(fbShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- Twitter
    func twitter(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            self.presentViewController(fbShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- Amazon Web Services Log-Out
       func logOut(){
        
        if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            ColorThemeSettings.sharedInstance.wipe()
            AWSIdentityManager.defaultIdentityManager().logoutWithCompletionHandler({(result: AnyObject?, error: NSError?) -> Void in
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let initViewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as UIViewController
                self.presentViewController(initViewController, animated: true, completion: nil)
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }

        
        
        /*
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        LoginService.sharedInstance.signOut()
        
        let controllerId = LoginService.sharedInstance.isLoggedIn() ? "Welcome" : "Login";
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initViewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier(controllerId) as UIViewController
        self.presentViewController(initViewController, animated: true, completion: nil)
 */
        
        
    }
    func uber(){
        
        let behavior = RideRequestViewRequestingBehavior(presentingViewController: self)
        let location = CLLocation(latitude: 37.787654, longitude: -122.402760)
        let parameters = RideParametersBuilder().setPickupLocation(location).build()
        let button = RideRequestButton(rideParameters: parameters, requestingBehavior: behavior)
        self.view.addSubview(button)
 
        
    }
    
    
    @IBAction func uberAction(sender: UIButton) {
        
        // If no pickup location is specified, the default is to use current location
        let parameters = RideParametersBuilder().build()
        // You can also explicitly the parameters to use current location
        let builder = RideParametersBuilder()
        builder.setPickupToCurrentLocation()
        // Use your_class as the delegate
        let behavior = RideRequestViewRequestingBehavior(presentingViewController: self)
        let delegate = MainViewController()
        behavior.modalRideRequestViewController.rideRequestViewController.delegate = delegate
        _ = RideRequestButton(rideParameters: parameters, requestingBehavior: behavior)
        //self.view.center.x = button.center.x
        
        
    }
    
}
extension LeftMenuTableViewController : RideRequestViewControllerDelegate {
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
}

