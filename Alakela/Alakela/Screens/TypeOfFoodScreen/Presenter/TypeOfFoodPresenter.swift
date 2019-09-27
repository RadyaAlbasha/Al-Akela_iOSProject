//
//  TypeOfFoodPresenter.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/24/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
class TypeOfFoodPresenter: TypeOfFoodPresenterProtocol {
    
    var TypeOfFoodDelegate: TypeOfFoodViewControllerProtocol?
    var networkDelegate: NetworkAccessProtocol?
    
    init() {
        // here we can send the NW Services
        networkDelegate = NetworkAccessClass()
        self.networkDelegate?.setTypeOfFoodPresenterDelegate(TypeOfFoodPresenterDelegete: self)
        
    }
    
    func setDelegate(delegate: NetworkAccessProtocol) {
        self.networkDelegate = delegate
    }
    func setDelegate(delegate: TypeOfFoodViewControllerProtocol) {
        self.TypeOfFoodDelegate = delegate
    }
    func showAdsImages() {
        self.networkDelegate?.getAdsUri()
    }
    
    func setAdUris(adUris: [String]!) {
        TypeOfFoodDelegate?.showAdImages(adUris: adUris)
    }
    
}
