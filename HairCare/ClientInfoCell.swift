//
//  ClientInfoCell.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Firebase

class ClientInfoCell: UITableViewCell {
    
//    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var clientDesc: UITextView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(info: FireClient, img: UIImage? = nil) {
//        clientName.text = info.name
        dateText.text = info.date
        clientDesc.text = info.description
        
        if img != nil {
            clientImage.image = img
        } else {
            let ref = STORAGE_BASE
//            reference(forURL: info.imageUrl)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("NATE: didnt download image from Firebase")
                } else {
                    print("image downloaded")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.clientImage.image = img
                            ClientInfoVC.imageCache.setObject(img, forKey: info.imageUrl)
                        }
                    }
                }
            })
        }
    }

}
