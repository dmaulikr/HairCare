//
//  FirePost.swift
//  HairCare
//
//  Created by Nathan Brewer on 8/3/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import Foundation

class FireClient {
    private var _name: String!
    private var _imageUrl: String!
    private var _date: String!
    private var _description: String!
    private var _postKey: String!
    
    var name: String {
        return _name
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var date: String {
        return _date
    }
    
    var description: String {
        return _description
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(name: String, imageUrl: String, date: String, description: String) {
        self._name = name
        self._imageUrl = imageUrl
        self._date = date
        self._description = description
    }
    
    init(postKey: String, postData: Dictionary<String, String>) {
        self._postKey = postKey
        
        if let name = postData["name"] {
            self._name = name
        }
        
        if let imageUrl = postData["imageUrl"] {
            self._imageUrl = imageUrl
        }
        
        if let date = postData["date"] {
            self._date = date
        }
        
        if let description = postData["description"] {
            self._description = description
        }
    }
    
}




