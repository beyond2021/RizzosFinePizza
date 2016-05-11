//
//  PizzaCellSlim.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/10/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class PizzaCellSlim: UITableViewCell {
    
    var foodItem : FoodItem?

    @IBOutlet weak var foodTitleLabel: UILabel!
    
    
    @IBOutlet weak var foodItemDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
