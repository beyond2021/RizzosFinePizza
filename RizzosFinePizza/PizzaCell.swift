//
//  PizzaCell.swift
//  RizzosFinePizza
//
//  Created by KEEVIN MITCHELL on 5/4/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

import UIKit

class PizzaCell: UITableViewCell {
    
    @IBOutlet weak var largeRoundButton: ACPButton!
    
    @IBOutlet weak var personalRoundButton: ACPButton!
    
    @IBOutlet weak var largeSquareButton: ACPButton!
    

    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var pizzaDescriptionLabel: UILabel!
    
    
    @IBAction func personalRoundAction(sender: ACPButton) {
    }
    
    
    @IBAction func largeRoundAction(sender: ACPButton) {
    }
    
    @IBAction func largeSquareAction(sender: ACPButton) {
    }
    
    @IBOutlet weak var foodItemImageView: UIImageView!
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
    }
    
    override func layoutSubviews() {
        
      
//        foodItemImageView.layer.cornerRadius = foodItemImageView.bounds.size.width / 2
//        foodItemImageView.clipsToBounds = true
        
        largeRoundButton.layer.cornerRadius = largeRoundButton.bounds.size.width / 2
        largeRoundButton.clipsToBounds = true
        
        personalRoundButton.layer.cornerRadius = personalRoundButton.bounds.size.width / 2
        personalRoundButton.clipsToBounds = true
        
//        largeSquareButton.layer.cornerRadius = largeSquareButton.bounds.size.width / 2
//        largeSquareButton.clipsToBounds = true
//        
       // largeRoundButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
       // largeRoundButton

        largeRoundButton.titleLabel!.textAlignment = NSTextAlignment.Center
        largeRoundButton.titleLabel!.numberOfLines = 0
        personalRoundButton.titleLabel!.textAlignment = NSTextAlignment.Center
        personalRoundButton.titleLabel!.numberOfLines = 0
        largeSquareButton.titleLabel!.textAlignment = NSTextAlignment.Center
        largeSquareButton.titleLabel!.numberOfLines = 0
        
        largeRoundButton.setStyle(UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0, alpha: 1.0), andBottomColor: UIColor(red:190.0/255.0, green: 26.0/255.0, blue: 19.0/255.0, alpha: 1.0))
        personalRoundButton.setStyle(UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0, alpha: 1.0), andBottomColor: UIColor(red:190.0/255.0, green: 26.0/255.0, blue: 19.0/255.0, alpha: 1.0))
        largeSquareButton.setStyle(UIColor(red:37.0/255.0, green: 7.0/255.0, blue: 30.0/255.0, alpha: 1.0), andBottomColor: UIColor(red:190.0/255.0, green: 26.0/255.0, blue: 19.0/255.0, alpha: 1.0))
        
        

//UIColor(red:190.0/255.0, green: 126.0/255.0, blue: 96.0/255.0, alpha: 1.0)
 
        
        
       /*
        [button setTitle: @"Line1\nLine2" forState: UIControlStateNormal];
        
        label.textAlignment = NSTextAlignment.Center;
        label.numberOfLines = 0;
        label.font = UIFont.systemFontOfSize(16.0);
        label.text = "First label\nsecond line";
 */
        
        
    }
    
    func configCellWithItem(item: FoodItem){
        foodNameLabel.text = item.title
        pizzaDescriptionLabel.text = item.itemDescription
       // largeSquarePriceLabel.text = "$"+"\(item.originalPrice[0])"
        
        let pr = item.originalPrice[0]
        personalRoundButton.setTitle("Personal RD \(pr)", forState: UIControlState.Normal)
        let lr = item.originalPrice[1]
        personalRoundButton.setTitle("Personal RD \(lr)", forState: UIControlState.Normal)
        let ls = item.originalPrice[2]
        personalRoundButton.setTitle("Personal RD \(ls)", forState: UIControlState.Normal)
        
        
        
    }
    
    
}
