//
//  RestaurantPresenterProtocol.swift
//  Alakela
//
//  Created by Radya Al-Basha on 10/7/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
protocol RestaurantPresenterProtocol {
    func setDelegate(delegate: NetworkAccessProtocol)
    func setDelegate(delegate: RestaurantViewControllerProtocol)
    func updateField(collectionKey : String ,documentKey : String, fieldKey : String, newData: String)
}
