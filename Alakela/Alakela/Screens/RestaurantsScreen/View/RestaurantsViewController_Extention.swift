//
//  RestaurantsViewController_Extention.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/20/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import ImageSlideshow

@available(iOS 13.0, *)
extension RestaurantsViewController: RestaurantsViewControllerProtocol, UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rCell", for: indexPath) as! RestaurantsTableViewCell
        let key = Array(restaurantsDict.keys.sorted())[indexPath.row]
     
        if let url = restaurantsDict[key]?.logoUri {
            cell.restaurantImgV.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"logo"))
        }
        cell.restaurantNameLabel.text = key
        cell.restaurantDetailsLabel.text = restaurantsDict[key]?.description
        
        if restaurantsDict[key]?.rate != nil{
            if let dRate = Double((restaurantsDict[key]?.rate!)!) {
                cell.cosmosView.rating =  dRate
            }
        }
        
        return cell
    }
    
    func showRestaurants(restaurantsDict: [String : Restaurant]) {
        self.restaurantsDict = restaurantsDict
        restaurantsTV.reloadData()
        networkIndicator.stopAnimating()
    }
    
    func setCollectionKey(collectionKey: String) {
        self.collectionKey = collectionKey
    }
    
    func showAdImages(adUris: [String]!) {
        if adUris != nil{
            var sdWebImageSource = [SDWebImageSource]()
            for uri in (adUris)!{
                
                    sdWebImageSource.append(SDWebImageSource(urlString: uri)!)//download images
                }
                adSlideShow.setImageInputs(sdWebImageSource)//show images
        }
        else{
            let localSource = [BundleImageSource(imageString: collectionKey!)]
            adSlideShow.setImageInputs(localSource)//show default image
        }
    }
}
