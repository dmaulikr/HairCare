//
//  CircleView.swift
//  HairCare
//
//  Created by Nathan Brewer on 8/4/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
