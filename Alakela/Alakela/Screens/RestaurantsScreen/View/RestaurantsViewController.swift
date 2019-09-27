//
//  RestaurantsViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/20/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import GoogleMobileAds

class RestaurantsViewController: UIViewController {

    @IBOutlet weak var restaurantsTV: UITableView!
    @IBOutlet weak var adBannerView: GADBannerView!
    
    @IBOutlet weak var typeImgV: UIImageView!
    var  restaurantsPresenter :  RestaurantsPresenterProtocol =  RestaurantsPresenter()
    var restaurantsDict: [String: Restaurant] = [:]
    var  networkIndicator : UIActivityIndicatorView!
    var collectionKey : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantsPresenter.setDelegate(delegate: self)
        
        // Do any additional setup after loading the view.
        UIMethodsClass.roundedView(rView: restaurantsTV, radius: 5)
        UIMethodsClass.roundedView(rView: typeImgV, radius: 5)
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
        networkIndicator = UIMethodsClass.showNetworkIndicator(view: self.view)
        restaurantsPresenter.getRestaurants(collectionKey: collectionKey!)
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
     
    }

}
