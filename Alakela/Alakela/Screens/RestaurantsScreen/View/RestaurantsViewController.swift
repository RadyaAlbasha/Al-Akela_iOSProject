//
//  RestaurantsViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/20/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import GoogleMobileAds
import ImageSlideshow

@available(iOS 13.0, *)
class RestaurantsViewController: UIViewController {

    @IBOutlet weak var restaurantsTV: UITableView!
    @IBOutlet weak var adBannerView: GADBannerView!
    
    @IBOutlet weak var adSlideShow: ImageSlideshow!
    
    var  restaurantsPresenter :  RestaurantsPresenterProtocol =  RestaurantsPresenter()
    var restaurantsDict: [String: Restaurant] = [:]
    var  networkIndicator : UIActivityIndicatorView!
    var collectionKey : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantsPresenter.setDelegate(delegate: self)
        
        // Do any additional setup after loading the view.
        //make view rounded
        UIMethodsClass.roundedView(rView: restaurantsTV, radius: 5)
        UIMethodsClass.roundedView(rView: adSlideShow, radius: 5)
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
         //show networkIndicator
        networkIndicator = UIMethodsClass.showNetworkIndicator(view: self.view)
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        adSlideShow.activityIndicator = UIMethodsClass.showNetworkIndicator(view: adSlideShow.subviews[0]) as? ActivityIndicatorFactory
        restaurantsPresenter.getRestaurants(collectionKey: collectionKey!)
        
        // setup imageSlideshow
        adSlideShow.slideshowInterval = 3.0
        adSlideShow.contentScaleMode = UIViewContentMode.scaleToFill
               
        adSlideShow.pageIndicator = nil
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        //show ads slideshow
        restaurantsPresenter.showAdsImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionKey != nil{
            self.title = collectionKey.localized
        }
        if let index = restaurantsTV.indexPathForSelectedRow{
            self.restaurantsTV.deselectRow(at: index, animated: true)
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        let restaurantDelegate = segue.destination as! RestaurantViewControllerProtocol
        let key = Array(restaurantsDict.keys.sorted())[(self.restaurantsTV?.indexPath(for: sender as! UITableViewCell)?.row)!]
        // Pass the selected object to the new view controller.
        restaurantDelegate.setRestaurant(restaurant: restaurantsDict[key])
        restaurantDelegate.setCollectionKey(collectionKey: collectionKey)
     
    }
    
    /*@IBAction func didUnwindFromRestaurantVC(_ sender : UIStoryboardSegue){
        guard let restaurantVC = sender.source as? RestaurantViewController else {return}
        restaurantsDict[restaurantVC.restaurant.name] = restaurantVC.restaurant
    }*/

}
