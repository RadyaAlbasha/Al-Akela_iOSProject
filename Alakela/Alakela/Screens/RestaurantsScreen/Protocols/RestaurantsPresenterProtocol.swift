//
//  RestaurantsPresenterProtocol.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/27/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
protocol RestaurantsPresenterProtocol {
    func setDelegate(delegate: NetworkAccessProtocol)
    func setDelegate(delegate: RestaurantsViewControllerProtocol)
    func setRestaurants(restaurantsDict: [String: Restaurant])
    func getRestaurants(collectionKey : String)
    func setAdUris(adUris : [String]!)
    func showAdsImages()
}
