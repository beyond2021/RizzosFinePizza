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
import AWSMobileHubHelper


class MainViewController: UIViewController,  AstoriaViewControllerDelegate, LesViewControllerDelegate,FBLoginViewControllerDelegate,CLLocationManagerDelegate {
    //MARK: - AWS
    var demoFeatures: [DemoFeature] = []
    var signInObserver: AnyObject!
    var signOutObserver: AnyObject!
    var willEnterForegroundObserver: AnyObject!
    
    // User Location
    var latitude : Double?
    var longitude : Double?
    
    
    @IBOutlet weak var stackView: UIStackView!
    
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
        // Reset Delivery Status
        dt = DeliveryStatus.None.rawValue
        sl = StoreLocation.None.rawValue
        
        //
        
        //if bgImageView.image == nil{
//            bgImageView.image = UIImage(named: "customBG")
//            
//        }

        
        
       // setUpInterface()
//        self.navigationController!.navigationBar.translucent = true
//        self.navigationController!.view.backgroundColor = UIColor.clearColor()

        //AWS
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
        // You need to call `- updateTheme` here in case the sign-in happens before `- viewWillAppear:` is called.
         updateTheme()
        
                willEnterForegroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationWillEnterForegroundNotification, object: nil, queue: NSOperationQueue.currentQueue()) { _ in
                    self.updateTheme()
                }
      
         
         var demoFeature = DemoFeature.init(
         name: NSLocalizedString("User Sign-in",
         comment: "Label for demo menu option."),
         detail: NSLocalizedString("Enable user login with popular 3rd party providers.",
         comment: "Description for demo menu option."),
         icon: "UserIdentityIcon", storyboard: "UserIdentity")
         
         demoFeatures.append(demoFeature)
         
         demoFeature = DemoFeature.init(
         name: NSLocalizedString("User Data Storage",
         comment: "Label for demo menu option."),
         detail: NSLocalizedString("Save user files in the cloud and sync user data in key/value pairs.",
         comment: "Description for demo menu option."),
         icon: "UserFilesIcon", storyboard: "UserDataStorage")
         
         demoFeatures.append(demoFeature)
         
         demoFeature = DemoFeature.init(
         name: NSLocalizedString("App Analytics",
         comment: "Label for demo menu option."),
         detail: NSLocalizedString("Collect, visualize and export app usage metrics.",
         comment: "Description for demo menu option."),
         icon: "AppAnalyticsIcon", storyboard: "AppAnalytics")
         
         demoFeatures.append(demoFeature)
         
         demoFeature = DemoFeature.init(
         name: NSLocalizedString("NoSQL",
         comment: "Label for demo menu option."),
         detail: NSLocalizedString("Store data in the cloud.",
         comment: "Description for demo menu option."),
         icon: "NoSQLIcon", storyboard: "NoSQLDatabase")
         
         demoFeatures.append(demoFeature)
        
        
        signInObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignInNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self] (note: NSNotification) -> Void in
            guard let strongSelf = self else { return }
            print("Sign In Observer observed sign in.")
            strongSelf.setupRightBarButtonItem()
            // You need to call `updateTheme` here in case the sign-in happens after `- viewWillAppear:` is called.
            strongSelf.updateTheme()
            })
        
        signOutObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignOutNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self](note: NSNotification) -> Void in
            guard let strongSelf = self else { return }
            print("Sign Out Observer observed sign out.")
            strongSelf.setupRightBarButtonItem()
            strongSelf.updateTheme()
            })
        
         setupRightBarButtonItem()
        //setUpSignIn()
        //
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        setupUber()
    }
    
    func updateTheme() {
        let settings = ColorThemeSettings.sharedInstance
        settings.loadSettings { (themeSettings: ColorThemeSettings?, error: NSError?) -> Void in
            guard let themeSettings = themeSettings else {
                print("Failed to load color: \(error)")
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                let titleTextColor: UIColor = themeSettings.theme.titleTextColor.UIColorFromARGB()
//                self.navigationController!.navigationBar.barTintColor = themeSettings.theme.titleBarColor.UIColorFromARGB()
                self.navigationController!.navigationBar.barTintColor = UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0, alpha: 1.0)
                
                
                self.view.backgroundColor = themeSettings.theme.backgroundColor.UIColorFromARGB()
//                self.view.backgroundColor = UIColor.clearColor()
                
                
                self.navigationController!.navigationBar.tintColor = titleTextColor
                self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: titleTextColor]
            })
        }
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       // bgImageView.alpha = 0
       // self.animate()
       
    }
    override func viewDidAppear(animated: Bool) {
       // lesButton.enabled = true
      //  steinwayButton.enabled = true
        beyondLabel.alpha = 0
//        if bgImageView.image == nil{
//           bgImageView.image = UIImage(named: "customBG")
//            
//        }
    }
    
    
    
    func goToLogin() {
        print("Handling optional sign-in.")
        let loginStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let loginController = loginStoryboard.instantiateViewControllerWithIdentifier("SignIn")
        navigationController!.pushViewController(loginController, animated: true)

        
    }
    
    func handleLogout() {
        if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            ColorThemeSettings.sharedInstance.wipe()
            AWSIdentityManager.defaultIdentityManager().logoutWithCompletionHandler({(result: AnyObject?, error: NSError?) -> Void in
                self.navigationController!.popToRootViewControllerAnimated(false)
                self.setupRightBarButtonItem()
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Actions
    /*
     UIView.animateWithDuration(0.9, delay: 20.5, options: [], animations: {
     self.beyondLabel.alpha = 0.0
     }, completion: nil)

 
 */
    
    
    @IBAction func steinwayAction(sender: UIButton) {
        steinwayButton.center.x += view.bounds.width
        
    }
    @IBAction func lesButton(sender: UIButton) {
        lesButton.center.x += view.bounds.width
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
    @IBAction func backToMain(segue:UIStoryboardSegue){
        
        
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
       // button.center.y = button.center.y + 430
        button.center.y = self.view.bounds.height - 120
        self.view.addSubview(button)
    }
    // MARK: - CLLocation Manager Delegate
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(signInObserver)
        NSNotificationCenter.defaultCenter().removeObserver(signOutObserver)
        NSNotificationCenter.defaultCenter().removeObserver(willEnterForegroundObserver)
    }
    class FeatureDescriptionViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .Plain, target: nil, action: nil)
        }
    }
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
    
    
    
    
    func setupRightBarButtonItem() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken, {
            let loginButton: UIBarButtonItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: nil)
            self.navigationItem.rightBarButtonItem = loginButton
        })
        
        if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-Out", comment: "Label for the logout button.")
            navigationItem.rightBarButtonItem!.action = #selector(MainViewController.handleLogout)
        }
        if !(AWSIdentityManager.defaultIdentityManager().loggedIn) {
            navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-In", comment: "Label for the login button.")
            navigationItem.rightBarButtonItem!.action = #selector(MainViewController.goToLogin)
            loginAlert()
        }
    }
    
    
    
}

