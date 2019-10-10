//
//  TypeOfFoodViewController_Extension.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/20/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
import UIKit
import ImageSlideshow

@available(iOS 13.0, *)
extension TypeOfFoodViewController: TypeOfFoodViewControllerProtocol,UITableViewDelegate , UITableViewDataSource{
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeOfFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! TypeOfFoodTableViewCell
        cell.typeImgV.image = UIImage(named: typeOfFood[indexPath.row])
        cell.typeLabel.text = typeOfFood[indexPath.row].localized
        return cell
    }
    
     // MARK: - TypeOfFoodViewControllerProtocol
    func setDelegate(delegate: TypeOfFoodPresenterProtocol) {
        self.typeOfFoodPresenter = delegate
    }
    
    func showAdImages(adUris: [String]!) {
        if adUris != nil{
            var sdWebImageSource = [SDWebImageSource]()
            for uri in (adUris)!{
                
                    sdWebImageSource.append(SDWebImageSource(urlString: uri)!)//download images
                }
                adSlideshow.setImageInputs(sdWebImageSource)//show images
        }
        else{
            adSlideshow.setImageInputs(localSource)//show default image
        }
        
        //networkIndicator.stopAnimating()
    }
    
    /*
    func showAdsImages(adSlideshow: ImageSlideshow!){
        let db = Firestore.firestore()
        db.collection(FirestoreKeys.Collection_Ads).getDocuments { [weak self](snapshot, error) in
            if error != nil{
                print("Error")
                adSlideshow.setImageInputs(self!.localSource)
            }else{
                var sdWebImageSource = [SDWebImageSource]()
                for document in (snapshot?.documents)!{
                    if let adUri = document.data()[FirestoreKeys.Field_adUri] as? String{
                       /* print("\n")
                        print(adUri)
                        print(document.documentID)
                        print("\n")*/
                        
                        sdWebImageSource.append(SDWebImageSource(urlString: adUri)!)
                    }
                }
                adSlideshow.setImageInputs(sdWebImageSource)
            }
        }
    }
    
    */
    
    
}

