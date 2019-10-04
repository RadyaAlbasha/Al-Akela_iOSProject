//
//  ViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/19/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import MOLH
import GoogleMobileAds
import ImageSlideshow

@available(iOS 13.0, *)
class TypeOfFoodViewController: UIViewController{
   
    @IBOutlet weak var typeTV: UITableView!
    
    @IBOutlet weak var languageButton: UIButton!
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    @IBOutlet weak var adSlideshow: ImageSlideshow!
    
    var  networkIndicator : UIActivityIndicatorView!
    
    let localSource = [BundleImageSource(imageString: "akela")]
    let typeOfFood = [FirestoreKeys.Collection_Pizza,FirestoreKeys.Collection_Shrimpy,FirestoreKeys.Collection_Chicken,FirestoreKeys.Collection_Barbecue,FirestoreKeys.Collection_Syrian,FirestoreKeys.Collection_Koushari,FirestoreKeys.Collection_Healthy,FirestoreKeys.Collection_Ice,FirestoreKeys.Collection_Dessert,FirestoreKeys.Collection_Market]//array of string
    var typeOfFoodPresenter : TypeOfFoodPresenterProtocol = TypeOfFoodPresenter()
    //var docRef: DocumentRefrence!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //delegate in storyboard
        //typeTV.delegate = self
        //typeTV.dataSource = self
        
        //show networkIndicator
        networkIndicator = UIMethodsClass.showNetworkIndicator(view: adSlideshow.subviews[0])
        
        typeOfFoodPresenter.setDelegate(delegate: self)
        
        //make view rounded
        UIMethodsClass.roundedView(rView: adSlideshow, radius: 5)
        UIMethodsClass.roundedView(rView: typeTV, radius: 5)
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
        languageButton.setTitle("LanguageButton".localized, for: .normal)
        
        // setup imageSlideshow
        adSlideshow.slideshowInterval = 3.0
        adSlideshow.contentScaleMode = UIViewContentMode.scaleToFill
        
        adSlideshow.pageIndicator = nil
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        //show ads slideshow
        typeOfFoodPresenter.showAdsImages()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let index = typeTV.indexPathForSelectedRow{
            self.typeTV.deselectRow(at: index, animated: true)
        }
    }
    
    @IBAction func didPressOnLanguage(_ sender: UIButton) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        let restaurantsDelegate = segue.destination as! RestaurantsViewControllerProtocol
        // Pass the selected object to the new view controller.
         restaurantsDelegate.setCollectionKey(collectionKey: typeOfFood[(self.typeTV?.indexPath(for: sender as! UITableViewCell)?.row)!])
    }
}

