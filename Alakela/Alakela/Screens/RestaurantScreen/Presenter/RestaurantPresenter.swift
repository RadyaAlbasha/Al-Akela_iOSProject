//
//  RestaurantPresenter.swift
//  Alakela
//
//  Created by Radya Al-Basha on 10/7/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
class  RestaurantPresenter:  RestaurantPresenterProtocol {
    
    var restaurantDelegate: RestaurantViewControllerProtocol?
    var networkDelegate: NetworkAccessProtocol?
    
    init() {
        // here we can send the NW Services
        networkDelegate = NetworkAccessClass()
        self.networkDelegate?.setRestaurantPresenterDelegate(restaurantPresenterDelegete: self)
        
    }
    
    func setDelegate(delegate: NetworkAccessProtocol) {
        self.networkDelegate = delegate
    }
    func setDelegate(delegate: RestaurantViewControllerProtocol) {
        self.restaurantDelegate = delegate
    }
    func updateField(collectionKey : String ,documentKey : String, fieldKey : String, newData: String){
        networkDelegate?.updateField(collectionKey: collectionKey, documentKey: documentKey, fieldKey: fieldKey, newData: newData)
       }
}
