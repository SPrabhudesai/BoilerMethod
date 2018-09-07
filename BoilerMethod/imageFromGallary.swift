//
//  imageFromGallary.swift
//  BoilerMethod
//
//  Created by shailesh on 03/09/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class imageFromGallary: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func openOption(){
        let alert = UIAlertController(title: "Select image", message: "Open from gallary", preferredStyle: .alert)
        
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default) { (btn) in
            self.imagePicker.sourceType = .photoLibrary
            self.openGallary()
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (btn) in
            self.imagePicker.sourceType = .camera
            self.openGallary()

        }
        let cancleAction = UIAlertAction(title: "Cancle", style: .destructive, handler: nil)
        
        alert.addAction(gallaryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)

    }
    func selectedImage(chossenImage:UIImage){
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chooseImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectedImage(chossenImage:chooseImage)
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)

    }
 
    func openGallary(){
        self.present(imagePicker, animated: true, completion: nil)
    }
}
