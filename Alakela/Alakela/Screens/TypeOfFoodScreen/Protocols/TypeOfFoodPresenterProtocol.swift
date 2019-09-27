//
//  TypeOfFoodPresenterProtocol.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/24/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
protocol TypeOfFoodPresenterProtocol {
    func setDelegate(delegate: NetworkAccessProtocol)
    func setDelegate(delegate: TypeOfFoodViewControllerProtocol)
    func setAdUris(adUris : [String]!)
    func showAdsImages() 
}
