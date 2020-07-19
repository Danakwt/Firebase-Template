//
//  TableViewCell.swift
//  FirebaseTemplate
//
//  Created by Meshaal Al-Munaikh on 7/17/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
}
