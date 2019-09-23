//
//  String-Extention.swift
//  Alakela
//
//  Created by Radya Al-Basha on 9/23/19.
//  Copyright © 2019 Radya Al-Basha. All rights reserved.
//

import Foundation
extension String{
    var localized: String{
        return NSLocalizedString(self, comment: "")
    }
}
