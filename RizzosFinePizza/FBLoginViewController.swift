//
//  FBLoginViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/24/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
protocol FBLoginViewControllerDelegate : class {
    func dismissfb()
}

class FBLoginViewController: UIViewController {
    weak var delegate : FBLoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
//        loginButton.readPermissions =
//        ["name","public_profile", "email", "user_friends","location"];
        view.addSubview(loginButton)

           
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMain(sender: UIButton) {
        self.delegate?.dismissfb()
    }

    /*
    -(void)loginButtonClicked
    {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
    logInWithReadPermissions: @[@"public_profile"]
    fromViewController:self
    handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
    if (error) {
    NSLog(@"Process error");
    } else if (result.isCancelled) {
    NSLog(@"Cancelled");
    } else {
    NSLog(@"Logged in");
    }
    }];
    }
 */
    
    func loginButtonClicked(){
        
        
    }
    
}
