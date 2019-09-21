//
//  ViewController.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/19/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import UIKit

class TypeOfFoodViewController: UIViewController{
   
    @IBOutlet weak var typeTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //delegate in storyboard
        //typeTV.delegate = self
        //typeTV.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        if let index = typeTV.indexPathForSelectedRow{
            self.typeTV.deselectRow(at: index, animated: true)
        }
    }

}

