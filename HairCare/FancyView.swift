//
//  FancyView.swift
//  HairCare
//
//  Created by Nathan Brewer on 8/1/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class FancyView: UIView {
    
    let SHADOW: CGFloat = 120.0 / 255.0

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(red: SHADOW, green: SHADOW, blue: SHADOW, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}
