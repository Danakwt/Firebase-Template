//
//  mainViewController.swift
//  FirebaseTemplate
//
//  Created by Meshaal Al-Munaikh on 7/17/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class mainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        myTableV.dataSource = self
        myTableV.delegate = self
        
        self.myTableV.reloadData()
        
        Networking.getListOf(COLLECTION_NAME: "Nadi") { (pet: [pets]) in
            self.petarray = pet
        }
    }
    
    
    var petarray: [pets] = []
    
    
    @IBOutlet weak var myTableV: UITableView!
    
    @IBAction func tapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goDetail", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
               performSegue(withIdentifier: "next", sender: indexPath.row)
           }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTableV.dataSource = self
        myTableV.delegate = self
        
        self.myTableV.reloadData()
        
        Networking.getListOf(COLLECTION_NAME: "Nadi") { (pet: [pets]) in
            self.petarray = pet
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let pet = petarray[indexPath.row]
        
        cell.petName.text = pet.addPet
        cell.age.text = pet.addAge
        cell.gender.text = pet.addGender
        cell.location.text = pet.platoon
        
        
        
        Networking.downloadImage(path: "Pets/\(pet.addAge)/\(pet.addAge).png") { (image) in
            cell.imageView?.image = image
        }
        
        
        return cell
    }
    
    
    
    // MARK: - Navigation

     
     
     
     
     
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.


           if segue.identifier == "next"{
             let index = sender as! Int
             let vc = segue.destination as! DetailVC
            vc.petArray = petarray[index]
           }
        }
        
    }
    


