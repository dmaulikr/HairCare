//
//  ClientVCViewController.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/30/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ClientVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [FireClient]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        ======Observer needs to be on ClientVC and listen for new clients added=====
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
            
        })


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell") as? ClientCell {
            cell.configureCell(post: post)
            return cell
            
        } else {
            let cell = ClientCell()
            cell.configureCell(post: post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


