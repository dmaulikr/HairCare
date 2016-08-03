//
//  ViewController.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/30/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class MainVC: UIViewController {
    
    @IBOutlet weak var addClientBtn: UIButton!
    
//    let storage = FIRStorage.storage()
//    let storageRef = FIRStorage.storage().reference(forURL: "haircare-e1604.firebaseio.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signOutTapped(_ sender: AnyObject) {
        let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("NATE: removed key from user \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "LoginVC", sender: nil)
    }

}

