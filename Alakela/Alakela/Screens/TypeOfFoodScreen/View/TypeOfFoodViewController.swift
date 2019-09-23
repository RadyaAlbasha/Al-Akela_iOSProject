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

class TypeOfFoodViewController: UIViewController{
   
    @IBOutlet weak var typeTV: UITableView!
    
    @IBOutlet weak var languageButton: UIButton!
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //delegate in storyboard
        //typeTV.delegate = self
        //typeTV.dataSource = self
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
        languageButton.setTitle("LanguageButton".localized, for: .normal)
        
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

