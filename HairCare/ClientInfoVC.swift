//
//  ClientInfoVC.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class ClientInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPostBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        ===Observer needs to be on ClientInfoVC and listen for client info added=====
//        ==============This listens for changes in the post======================
//        DataServices.instance.REF_USER.observe(.value, with: { (snapshot) in
//            print(snapshot.value) <- this prints the details of the branch
//          ====================================
//        })
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }
    
    @IBAction func addPostPressed(_ sender: UIButton) {
        
    }
    
//    func onPostsLoaded(notif: AnyObject) {
//        tableView.reloadData()
//    }
    
    

}
