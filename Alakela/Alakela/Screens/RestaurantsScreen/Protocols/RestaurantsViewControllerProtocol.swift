//
//  RestaurantsViewControllerProtocol.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/27/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
protocol RestaurantsViewControllerProtocol {
    func showRestaurants(restaurantsDict: [String: Restaurant])
    func setCollectionKey(collectionKey : String)
    func showAdImages(adUris: [String]!)
}
