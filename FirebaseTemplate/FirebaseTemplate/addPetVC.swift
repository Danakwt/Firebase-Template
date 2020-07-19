//
//  addPetVC.swift
//  FirebaseTemplate
//
//  Created by Meshaal Al-Munaikh on 7/19/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class addPetVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var addPet: UITextField!
    @IBOutlet weak var platoon: UITextField!
    @IBOutlet weak var addAge: UITextField!
    @IBOutlet weak var addGender: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
  
    
    @IBAction func takePhoto(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               
               
               if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                   imageView.image = userPickedImage
       //            print(userPickedImage.imageAsset)
          }
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            fileName = url.lastPathComponent
            fileType = url.pathExtension
           
           print(fileName)
        }

               
               imagePicker.dismiss(animated: true, completion: nil)
               
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = true
        
    }
    
    
    var fileName = ""
    var fileType = ""
    @IBAction func ADD(_ sender: Any) {
        
        let  pet = pets(addPet: addPet.text!, platoon: platoon.text!, addAge: addAge.text!, addGender: addGender.text!, phoneNumber: phoneNumber.text!, image: fileName)
        
            
        Networking.createItem(pet, inCollection: "Nadi", success: {
            print("تمت اضافة النادي بنجاح")
        })
        Networking.uploadImage(path: "Pets/\(addAge.text!)", imageName: "\(addAge.text!)", image: imageView.image!) {
            print("تمت اضافة الصورة بنجاح")
        }
        
    }
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
