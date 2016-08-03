//
//  LoginVC.swift
//  HairCare
//
//  Created by Nathan Brewer on 8/1/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            print("NATE: it worked")
            if let main = self.storyboard?.instantiateViewController(withIdentifier: "MainVC"){
                main.modalTransitionStyle = .crossDissolve
                present(main, animated: true, completion: nil)
            }
            
        }
    }
//    override func viewDidAppear(animated: Bool) {
//             if let _ = KeychainWrapper.stringForKey(KEY_UID) {
//                print("NATE it worked")
//                performSegue(withIdentifier: "MainVC", sender: nil)
//            }
//
//        }
    
    @IBAction func enterHerePressed(_ sender: FancyButton) {
        if let email = emailTxt.text, let pwd = passwordTxt.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("NATE: User authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("NATE: There was a problem \(error.debugDescription)")
                        } else {
                            print("Successfully created user")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                        
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataServices.instance.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("NATE: data saved to keychain \(keychainResult)")

        if let main = self.storyboard?.instantiateViewController(withIdentifier: "MainVC"){
            main.modalTransitionStyle = .crossDissolve
            present(main, animated: true, completion: nil)
            }
        
    }
}
