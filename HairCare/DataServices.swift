//
//  DataServices.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import Foundation
import UIKit


class DataServices {
    static let instance = DataServices()
    
    var loadedPosts = [ClientInfo]()
    var loadedClient = [Client]()
    
    func savePost() {
        let postData = NSKeyedArchiver.archivedData(withRootObject: loadedPosts)
        UserDefaults.standard.set(postData, forKey: "posts")
        UserDefaults.standard.synchronize()
    
    }
    
    func saveClient() {
        let clientData = NSKeyedArchiver.archivedData(withRootObject: loadedClient)
        UserDefaults.standard.set(clientData, forKey: "clients")
        UserDefaults.standard.synchronize()
    }
    
    func loadPost() {
        if let postsData = UserDefaults.standard.object(forKey: "posts") as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData as Data) as? [ClientInfo] {
                loadedPosts = postsArray
            }
        }
        
        NotificationCenter.default.post(NSNotification(name: "postsLoaded" as NSNotification.Name, object: nil) as Notification)
    }
    
    func loadClient() {
        if let clientsData = UserDefaults.standard.object(forKey: "clients") as? NSData {
            if let clientsArray = NSKeyedUnarchiver.unarchiveObject(with: clientsData as Data) as? [Client] {
                loadedClient = clientsArray
            }
        }
        
        NotificationCenter.default.post(NSNotification(name: "postsLoaded" as NSNotification.Name, object: nil) as Notification)
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        if let fullPath = documentsPathForFileName(name: imgPath) as? URL {
            try! imgData?.write(to: fullPath as URL, options: .atomic)
        }
        
        return imgPath
        
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(name: path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(client: ClientInfo) {
        loadedPosts.append(client)
        savePost()
        loadPost()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
    func addClient(clientName: Client) {
        loadedClient.append(clientName)
        saveClient()
        loadClient()
    }
    
}
