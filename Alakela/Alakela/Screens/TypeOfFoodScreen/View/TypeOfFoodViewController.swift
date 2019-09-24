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

class TypeOfFoodViewController: UIViewController{
   
    @IBOutlet weak var typeTV: UITableView!
    
    @IBOutlet weak var languageButton: UIButton!
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    @IBOutlet weak var adSlideshow: ImageSlideshow!
    
     let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //delegate in storyboard
        //typeTV.delegate = self
        //typeTV.dataSource = self
        
        UIMethodsClass.roundedView(rView: adSlideshow, radius: 5)
        UIMethodsClass.roundedView(rView: typeTV, radius: 5)
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
        languageButton.setTitle("LanguageButton".localized, for: .normal)
        
        // Do any additional setup after loading the view.
        adSlideshow.slideshowInterval = 5.0
        adSlideshow.contentScaleMode = UIViewContentMode.scaleToFill
        
        adSlideshow.pageIndicator = nil
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        adSlideshow.setImageInputs(localSource)
        
        
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
    

}

