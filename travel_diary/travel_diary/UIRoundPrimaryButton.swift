//
//  UIRoundPrimaryButton.swift
//  travel_diary
//
//  Created by 허예은 on 2020/07/13.
//  Copyright © 2020 허예은. All rights reserved.
//

import Foundation
import UIKit

class UIRoundPrimaryButton: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor.systemPink
        self.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
}
