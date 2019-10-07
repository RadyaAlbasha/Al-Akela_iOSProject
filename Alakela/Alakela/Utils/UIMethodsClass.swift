//
//  UIMethodsClass.swift
//  NewsApp
//
//  Created by Radya Albasha on 8/1/19.
//  Copyright © 2019 Ember. All rights reserved.
//

import UIKit
import GoogleMobileAds

@available(iOS 13.0, *)
class UIMethodsClass {
   
    static func roundedView (rView : AnyObject , radius : CGFloat){
        rView.layer.cornerRadius = radius
        rView.layer.masksToBounds = true
    }
    static func showInternetConnectionAlert(viewController : UIViewController) {
        let alert = UIAlertController(title: "No Internet Connection", message: "Pleas Check Your Internet Connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    static func loadAdBannerView(adBannerView: GADBannerView! , rootViewController : UIViewController){
        //load banner biew ads
        //let adRequest = GADRequest()
        //adRequest.testDevices = [(kGADSimulatorID as! String)] // Sample device ID
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [(kGADSimulatorID as! String)] // Sample device ID
        
        adBannerView.adUnitID = Constants.AD_UNIT_ID
        adBannerView.rootViewController = rootViewController
        //adBannerView.load(adRequest)
        adBannerView.load(GADRequest())
    }
  
    static func showNetworkIndicator(view : UIView) -> UIActivityIndicatorView
    {
        let networkIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        networkIndicator.color = CustomColor.orange800
        networkIndicator.center = view.center
        networkIndicator.startAnimating()
        view.addSubview(networkIndicator)
        return networkIndicator
    }
}
