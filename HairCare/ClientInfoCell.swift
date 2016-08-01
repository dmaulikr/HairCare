//
//  ClientInfoCell.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class ClientInfoCell: UITableViewCell {
    
    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var clientDesc: UITextView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(info: ClientInfo) {
        clientName.text = info.name
        clientImage.image = DataServices.instance.imageForPath(path: info.imagePath!)
        dateText.text = info.currentDate
        clientDesc.text = info.productInfo
    }

}
