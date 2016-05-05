//
//  PizzaCell.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/4/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class PizzaCell: UITableViewCell {

    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var pizzaDescriptionLabel: UILabel!
    
    @IBOutlet weak var personalRoundLabel: UILabel!
    
    @IBOutlet weak var largeRoundPrice: UILabel!
    
    @IBOutlet weak var largeSquarePriceLabel: UILabel!
    
    @IBAction func personalRoundAction(sender: UIButton) {
    }
    
    
    @IBAction func largeRoundAction(sender: UIButton) {
    }
    
    @IBAction func largeSquareAction(sender: UIButton) {
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
    }
    
//    required  init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//        
//        )
    
        
 //   }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configCellWithItem(item: FoodItem){
        foodNameLabel.text = item.title
        pizzaDescriptionLabel.text = item.itemDescription
        largeSquarePriceLabel.text = "\(item.originalPrice)"
        
        
        
    }
    
    
}
