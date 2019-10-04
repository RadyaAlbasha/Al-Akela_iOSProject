//
//  RestaurantViewController_Extention.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/27/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
import GoogleMobileAds
@available(iOS 13.0, *)
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
    func choosePhoneNumberToCall(numbers : [String]!) {
       /* guard let numberStr = number , let url = URL(string: "telprompt://\(numberStr)") else {
            return
        }
        UIApplication.shared.open(url)*/
        let alert = UIAlertController(title: "ChooseNumberTitle".localized, message: "ChooseNumberMsg".localized, preferredStyle: .alert)
        
        for number in numbers{
            print(number)
            if let url = URL(string: "telprompt://\(number)"){
                   
                   if UIApplication.shared.canOpenURL(url) {
                       let numberAction = UIAlertAction(title: number , style: .default, handler: { _ in
                            UIApplication.shared.open(url)
                        
                       })
                       alert.addAction(numberAction)
                }
            }
        }
       
        if alert.actions.count == 0 {
            alert.title = "NoNumbers".localized
            alert.message = ""
            alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: nil))
        } else {
            alert.addAction(UIAlertAction(title: "Cancel".localized, style: .destructive, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
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
