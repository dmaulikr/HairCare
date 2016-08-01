//
//  File.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/30/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import Foundation

class ClientInfo: Client {
    
        var currentDate: String!
        var productInfo: String!
        var imagePath: String!
    
    init(name: String, date: String, info: String, image: String) {
        
        self.currentDate = date
        self.productInfo = info
        self.imagePath = image
        super.init(name: name)

    }
    
    override init(name: String) {
        super.init(name: name)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.currentDate = aDecoder.decodeObject(forKey: "date") as! String
        self.productInfo = aDecoder.decodeObject(forKey: "info") as! String
        self.imagePath = aDecoder.decodeObject(forKey: "image") as! String
        
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.currentDate, forKey: "date")
        aCoder.encode(self.productInfo, forKey: "info")
        aCoder.encode(self.imagePath, forKey: "image")
    }
}
