//
//  RestaurantsTableViewCell.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/20/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import Cosmos
class RestaurantsTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImgV: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var restaurantDetailsLabel: UILabel!
    
    @IBOutlet weak var cosmosView: CosmosView!
    
    var imageRadius : CGFloat!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //show only
        cosmosView.settings.updateOnTouch = false
        
        if imageRadius == nil{
            imageRadius = restaurantImgV.frame.width / 2
        }
        
        //typeImgV.tintColor =  CustomColor.blueIcons
        UIMethodsClass.roundedView(rView: restaurantImgV, radius: CGFloat(imageRadius))
        restaurantDetailsLabel.adjustsFontSizeToFitWidth = true
    }

}
