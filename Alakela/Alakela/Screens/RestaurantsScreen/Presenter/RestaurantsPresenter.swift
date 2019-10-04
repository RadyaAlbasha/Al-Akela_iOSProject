//
//  RestaurantsPresenter.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/27/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
class RestaurantsPresenter: RestaurantsPresenterProtocol {
    
    var restaurantsDelegate: RestaurantsViewControllerProtocol?
    var networkDelegate: NetworkAccessProtocol?
    
    init() {
        // here we can send the NW Services
        networkDelegate = NetworkAccessClass()
        self.networkDelegate?.setRestaurantsPresenterDelegate(RestaurantsPresenterDelegete: self)
        
    }
    
    func setDelegate(delegate: NetworkAccessProtocol) {
        self.networkDelegate = delegate
    }
    
    func setDelegate(delegate: RestaurantsViewControllerProtocol) {
        self.restaurantsDelegate = delegate
    }
    
    func getRestaurants(collectionKey : String){
        networkDelegate?.getRestaurants(collectionKey: collectionKey)
    }
    
    func setRestaurants(restaurantsDict: [String : Restaurant]) {
        restaurantsDelegate?.showRestaurants(restaurantsDict: restaurantsDict)
    }
    func showAdsImages() {
        self.networkDelegate?.getAdsUri(collection: FirestoreKeys.Collection_Ads2)
    }
    func setAdUris(adUris: [String]!) {
        restaurantsDelegate?.showAdImages(adUris: adUris)
    }
}
