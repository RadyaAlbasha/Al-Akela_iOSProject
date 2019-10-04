//
//  TypeOfFoodTableViewCell.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/19/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class TypeOfFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImgV: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    var imageRadius : CGFloat!
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageRadius == nil{
            imageRadius = typeImgV.frame.width / 2
        }
        
        //typeImgV.tintColor =  CustomColor.blueIcons
        UIMethodsClass.roundedView(rView: typeImgV, radius: CGFloat(imageRadius))
        typeLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
