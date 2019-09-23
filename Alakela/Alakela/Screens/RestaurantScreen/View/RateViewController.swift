//
//  RateViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/21/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit
import Cosmos
class RateViewController: UIViewController {

    @IBOutlet weak var rateV: CosmosView!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        let str = "\("Rating".localized) \(String(rateV.rating).localized)\("/5.0".localized)"
        rateLabel.text = str
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
