//
//  addingClientVC.swift
//  HairCare
//
//  Created by Nathan Brewer on 7/31/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit
import Foundation

class addingClientinfoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var productInfo: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postBtn.layer.cornerRadius = 33
        cancelBtn.layer.cornerRadius = 25
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        
    }
    @IBAction func selectPicture(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func postBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        if let date = dateTxt.text, let desc = productInfo.text, let img = clientImage.image {
            
            let imgPath = DataServices.instance.saveImageAndCreatePath(image: img)
            
            let post = ClientInfo(name: "", date: date, info: desc, image: imgPath)
            DataServices.instance.addPost(client: post)
            
            
        }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo image: UIImage) {
        imagePicker.dismiss(animated: true, completion: nil)
        clientImage.image = image
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo image: UIImage, info: [String : AnyObject]?) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        clientImage.image = image
//    }

}
