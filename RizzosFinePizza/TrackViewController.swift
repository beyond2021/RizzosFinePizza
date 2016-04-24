//
//  TrackViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 4/24/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol TrackViewControllerDelegate : class {
    func dismissTrack()
}

class TrackViewController: UIViewController {
    weak var delegate : TrackViewControllerDelegate?
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func back(sender: UIButton) {
        self.delegate?.dismissTrack()
        
        
    }

}
