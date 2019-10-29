//
//  FoodTableViewCell.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
