//
//  AddToCartViewController.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/6/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {
    
   // var fooItem : FoodItem?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityNumberLabel: UILabel!
    
    @IBOutlet weak var addOrRemoveSeg: UISegmentedControl!
    
    @IBAction func AddOrRemoveAction(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var addButtonLabel: UIButton!

    @IBAction func addAction(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
