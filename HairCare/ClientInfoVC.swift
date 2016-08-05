//
//  ClientInfoVC.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase

class ClientInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPostBtn: UIButton!
    @IBOutlet weak var clientName: UILabel!
    
    var passedData = ""
    
    

    var posts = [FireClient]()
    static var imageCache: Cache<NSString, UIImage> = Cache()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        clientName.text = passedData
        
        self.parseData()
        
        
        
//        ===Observer needs to be on ClientInfoVC and listen for client info added=====
//        ==============This listens for changes in the post======================

        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ClientInfoCell") as? ClientInfoCell {
            
            if let img = ClientInfoVC.imageCache.object(forKey: post.imageUrl) {
                cell.configureCell(info: post, img: img)
                return cell
            } else {
                return ClientInfoCell()
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }
    
    func parseData() {
        DataServices.instance.REF_CLIENT.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String,String> {
                        let key = snap.key
                        let post = FireClient(postKey: key, postData: postDict)
                        self.posts.append(post)
                        print("JJJ: \(post.name)")
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    @IBAction func addPostPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "addPost", sender: self)
    }
    
    // ==========to get clientVC name to pull content, possibly use indexPath.row======
}

