//
//  Client.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/30/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import Foundation


class Client: NSObject, NSCoding {
    
    var name: String!

    
    init(name: String) {
        self.name = name
        super.init()

    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.name = (aDecoder.decodeObject(forKey: "name") as? String)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
    }
    
}
