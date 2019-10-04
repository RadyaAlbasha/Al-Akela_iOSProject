//
//  NetworkAccessProtocol.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/24/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
protocol NetworkAccessProtocol {
    func setTypeOfFoodPresenterDelegate(TypeOfFoodPresenterDelegete : TypeOfFoodPresenterProtocol)
    func getAdsUri(collection : String)
    //
    func setRestaurantsPresenterDelegate(RestaurantsPresenterDelegete: RestaurantsPresenterProtocol)
     func getRestaurants(collectionKey : String)
}
