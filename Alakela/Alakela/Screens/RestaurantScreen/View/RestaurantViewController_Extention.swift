//
//  RestaurantViewController_Extention.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/27/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
import GoogleMobileAds
extension RestaurantViewController: RestaurantViewControllerProtocol ,GADBannerViewDelegate {
  
    // MARK: - GADBannerViewDelegate
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
    
    func makePhoneCall(number : String!) {
        guard let numberStr = number , let url = URL(string: "telprompt://\(numberStr)") else {
            return
        }
        UIApplication.shared.open(url)
    }
    
     // MARK: - RestaurantViewControllerProtocol
    func setRestaurant(restaurant: Restaurant!) {
        self.restaurant = restaurant
    }
    //
    func showRestaurantDetails(restaurant: Restaurant){
        if let url = restaurant.logoUri {
            restaurantImgV.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"logo"))
        }
        if restaurant.location != nil {
             locationLabel.text = restaurant.location
        }
        if restaurant.description != nil {
            foodTypeLabel.text = restaurant.description
        }
        if restaurant.timeDelivery != nil {
            timeLabel.text = "\(restaurant.timeDelivery!) \("min".localized) "
        }
        if restaurant.view != nil {
            viewLabel.text = restaurant.view
        }

    }
    /*func showMenuImages(menuUri : [String]!) {
        
    }*/
   
}
