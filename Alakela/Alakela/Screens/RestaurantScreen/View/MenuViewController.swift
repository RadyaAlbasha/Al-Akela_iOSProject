//
//  MenuViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/21/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import ImageSlideshow
@available(iOS 13.0, *)
class MenuViewController: UIViewController {

    @IBOutlet weak var slideshow: ImageSlideshow!
   // let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
    var restaurant : Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIMethodsClass.roundedView(rView: slideshow.subviews[0], radius: 5)
        UIMethodsClass.roundedView(rView: slideshow, radius: 5)
        
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = UIMethodsClass.showNetworkIndicator(view: slideshow.subviews[0]) as? ActivityIndicatorFactory
        slideshow.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        //slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        showMenuImages(menuUri: restaurant.menuUri)
    }
    @available(iOS 13.0, *)
    @objc func didTap() {
        
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .medium, color: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

@available(iOS 13.0, *)
extension MenuViewController: ImageSlideshowDelegate {
        func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
            print("current page:", page)
        }
    
        func showMenuImages(menuUri : [String]!) {
            if menuUri != nil{
                var sdWebImageSource = [SDWebImageSource]()
                for uri in (menuUri)!{
                    
                    if let img = SDWebImageSource(urlString: uri){//download images
                        sdWebImageSource.append(img)
                    }
                }
                slideshow.setImageInputs(sdWebImageSource)//show images
            }else{
                let localSource = [BundleImageSource(imageString: "akela")]
                slideshow.setImageInputs(localSource)
            }
            
        }
}
