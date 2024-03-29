//
//  RestaurantViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/21/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import GoogleMobileAds
import MapKit

@available(iOS 13.0, *)
class RestaurantViewController: UIViewController {

    @IBOutlet weak var rateView: UIView!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var restaurantImgV: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    @IBOutlet weak var viewLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    @IBOutlet weak var detailsView: UIView!
    
    var restaurantPresenter : RestaurantPresenterProtocol = RestaurantPresenter()
    var collectionKey : String!
    var restaurant : Restaurant!
    var menuViewController: MenuViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantPresenter.setDelegate(delegate: self)
        
        // Do any additional setup after loading the view.
        UIMethodsClass.roundedView(rView: restaurantImgV, radius: 5)
        UIMethodsClass.roundedView(rView: detailsView, radius: 5)
        
        //segment.tintColor = CustomColor.orange700
        
        //load banner biew ads
        UIMethodsClass.loadAdBannerView(adBannerView: adBannerView, rootViewController: self)
        
       //start by selecting menu
        //segment.selectedSegmentIndex = 0
        rateView.alpha = 0
        
        //change segment selected TextColor
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: CustomColor.orange800], for: UIControl.State.selected)
    //
        UIMethodsClass.roundedView(rView: restaurantImgV, radius: CGFloat(restaurantImgV.frame.width / 2))
        locationLabel.adjustsFontSizeToFitWidth = true
        foodTypeLabel.adjustsFontSizeToFitWidth = true
        viewLabel.adjustsFontSizeToFitWidth = true
        statusLabel.adjustsFontSizeToFitWidth = true
        timeLabel.adjustsFontSizeToFitWidth = true
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if restaurant != nil{
            self.title = restaurant.name
            if restaurant.view != nil{
                let view = "\(Int(restaurant.view)!+1)"
                restaurant.view = view
                restaurantPresenter.updateField(collectionKey: collectionKey, documentKey: restaurant.name, fieldKey: FirestoreKeys.Field_view , newData: view)
            }
            
            showRestaurantDetails(restaurant: restaurant)
            
        }
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            rateView.alpha = 0
            menuView.alpha = 1
        }else{
            rateView.alpha = 1
            menuView.alpha = 0
        }
    }
    
    @IBAction func complaint(_ sender: UIButton) {
        let alert = UIAlertController(title:"Alakela".localized, message:"Complaint".localized, preferredStyle: .alert)
       
        alert.addAction(UIAlertAction(title: "Yes".localized, style: .default, handler: { action in
            //code
            let str = self.restaurant.ownerPhone
            self.makePhoneCall(number: str)
        }))
        alert.addAction(UIAlertAction(title: "No".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
 
    }
    
    @IBAction func call(_ sender: UIButton) {
        print("call")
        choosePhoneNumberToCall(numbers: restaurant.numbers)
    }
    
    @IBAction func showLocation(_ sender: UIButton) {
        // open map
        let latitude:CLLocationDegrees = 39.048825
        let longitude:CLLocationDegrees = -120.981227
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "restaurant name"
        mapItem.openInMaps(launchOptions: options)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "menuViewSegue" {
                   menuViewController = segue.destination as? MenuViewController
                   menuViewController?.restaurant = restaurant
                  // menuViewController!.containerToMaster = self
               }
    }
    

}

