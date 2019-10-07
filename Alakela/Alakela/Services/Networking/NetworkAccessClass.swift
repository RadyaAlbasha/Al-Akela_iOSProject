//
//  NetworkAccessClass.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/24/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
import FirebaseFirestore
import ImageSlideshow

class NetworkAccessClass: NetworkAccessProtocol {
    
    var typeOfFoodPresenter : TypeOfFoodPresenterProtocol?
    var restaurantsPresenter : RestaurantsPresenterProtocol?
    var restaurantPresenter : RestaurantPresenterProtocol?
    //let db = Firestore.firestore()
    
    init() {
        
        typeOfFoodPresenter?.setDelegate(delegate: self)
        restaurantsPresenter?.setDelegate(delegate: self)
    }
    
    func setTypeOfFoodPresenterDelegate(TypeOfFoodPresenterDelegete: TypeOfFoodPresenterProtocol) {
         self.typeOfFoodPresenter = TypeOfFoodPresenterDelegete
    }
    
    func setRestaurantsPresenterDelegate(RestaurantsPresenterDelegete: RestaurantsPresenterProtocol) {
         self.restaurantsPresenter = RestaurantsPresenterDelegete
    }
    
    func setRestaurantPresenterDelegate(restaurantPresenterDelegete:  RestaurantPresenterProtocol){
        self.restaurantPresenter = restaurantPresenterDelegete
    }
    
    func getAdsUri(collection : String){
        print("\ngetads\n")
        let db = Firestore.firestore()
        var adUris : [String]!
        db.collection(collection).getDocuments { [weak self](snapshot, error) in
            if error != nil{
                print("Error")
            }else{
                adUris = [String]()
                for document in (snapshot?.documents)!{
                    if let adUri = document.data()[FirestoreKeys.Field_adUri] as? String{
                        /* print("\n")
                         print(adUri)
                         print(document.documentID)
                         print("\n")*/
                        adUris.append(adUri)
                    }
                }
            }
             if(collection == FirestoreKeys.Collection_Ads){
                           self?.typeOfFoodPresenter?.setAdUris(adUris: adUris)}
                       else{
                           self?.restaurantsPresenter?.setAdUris(adUris: adUris)}
        }
    }
    
    func getRestaurants(collectionKey : String){
        print("\ngetRestaurant\n")
        let db = Firestore.firestore()
        var restaurantsDict: [String: Restaurant] = [:]
        db.collection(collectionKey).getDocuments { [weak self](snapshot, error) in
            if error != nil{
                print("Error")
            }else{
                //restaurant = Restaurant(countUser: "", description: "", location: "", logoUri: "", map: "", menuUri: [""], name: "", numbers: [""], ownerPhone: "", rate: "", timeDelivery: "", view: "")
            
                for document in (snapshot?.documents)!{
                    let restaurant = Restaurant(countUser: (document.data()[FirestoreKeys.Field_countUser] as? String),
                                                description: document.data()[FirestoreKeys.Field_description] as? String,
                                                location: document.data()[FirestoreKeys.Field_location] as? String,
                                                logoUri: document.data()[FirestoreKeys.Field_logoUri] as? String,
                                                map: document.data()[FirestoreKeys.Field_map] as? String,
                                                menuUri: document.data()[FirestoreKeys.Field_menuUri] as? [String],
                                                name: document.data()[FirestoreKeys.Field_name] as? String,
                                                numbers: document.data()[FirestoreKeys.Field_numbers] as? [String],
                                                ownerPhone: document.data()[FirestoreKeys.Field_ownerPhone] as? String,
                                                rate: document.data()[FirestoreKeys.Field_rate] as? String,
                                                timeDelivery: document.data()[FirestoreKeys.Field_timeDelivery] as? String,
                                                view: document.data()[FirestoreKeys.Field_view] as? String)
                    restaurantsDict[document.documentID] = restaurant // add new element
                        /* print("\n")
                         print(adUri)
                         print(document.documentID)
                         print("\n")*/
                        //adUris.append(adUri)
                    
                }
            }
            self?.restaurantsPresenter?.setRestaurants(restaurantsDict: restaurantsDict)
           // self?.typeOfFoodPresenter?.setAdUris(adUris: adUris)
        }
    }
    
    
    func updateField(collectionKey : String ,documentKey : String, fieldKey : String, newData: String){
        let db = Firestore.firestore()
        db.collection(collectionKey).document(documentKey).updateData([fieldKey : newData])
    }
}
