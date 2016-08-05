//
//  addClientVC.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase

class addClientVC: UIViewController {
    
    @IBOutlet weak var clientName: UITextField!
    @IBOutlet weak var addClientBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addClientBtn.layer.cornerRadius = 80
        addClientBtn.layer.masksToBounds = true
        
    }
    
    @IBAction func addClientPressed(_ sender: UIButton) {
        
//        if let name = clientName.text {
//            DataServices.instance.createFirebaseDBUser(uid: id, name: name)
            
//            let post = Client(name: name)
//            DataServices.instance.addClient(clientName: post)
//            dismiss(animated: true, completion: nil)
//
        
        
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
