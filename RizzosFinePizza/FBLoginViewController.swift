//
//  FBLoginViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/24/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class FBLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        view.addSubview(loginButton)

           
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
