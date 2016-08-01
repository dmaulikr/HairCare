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
        
        addPostBtn.layer.cornerRadius = 33
        addPostBtn.layer.masksToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataServices.instance.loadPost()
     
        NotificationCenter.default.addObserver(self, selector: Selector(("onPostsLoaded:")), name: "postsLoaded" as NSNotification.Name, object: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let clientsInfo = DataServices.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ClientInfoCell") as? ClientInfoCell {
            cell.configureCell(info: clientsInfo)
            return cell
            
        } else {
            let cell = ClientInfoCell()
            cell.configureCell(info: clientsInfo)
            return cell
        }

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.loadedPosts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }
    
    @IBAction func addPostPressed(_ sender: UIButton) {
        
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
    

}
