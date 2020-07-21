//
//  DetailVC.swift
//  FirebaseTemplate
//
//  Created by Meshaal Al-Munaikh on 7/19/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var lableAge: UILabel!
    @IBOutlet weak var lableGender: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
    
    
    
    
    var petArray: pets! = nil
    
    
    
    
    
    
    @IBAction func AdoptionTaped(_ sender: Any) {
        
        
        makePhoneCall(phoneNumber: petArray.phoneNumber)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        set()
    }
    

    
    
    func set() {
        
        petName.text! = petArray.addPet
        priceLable.text! = petArray.platoon
        lableGender.text! = petArray.addGender
        lableAge.text! = petArray.addAge
        
        Networking.downloadImage(path: "Pets/\(petArray.addAge)/\(petArray.addAge).png") { (image) in
            self.imageView.image = image
        }
        
    }
    
    
    
    
    

    func makePhoneCall(phoneNumber: String) {
        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {
            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.openURL(phoneURL as URL)
            }))
      
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    
            self.present(alert, animated: true, completion: nil)
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

