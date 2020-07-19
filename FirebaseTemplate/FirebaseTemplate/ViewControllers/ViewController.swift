//
//  ViewController.swift
//  PetShop
//
//  Created by Meshaal Al-Munaikh on 7/12/20.
//  Copyright © 2020 DANA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func TakePhoto(_ sender: Any) {
     
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraView = UIImagePickerController()
            cameraView.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            cameraView.sourceType = .camera
            self.present(cameraView, animated: true, completion: nil)
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

