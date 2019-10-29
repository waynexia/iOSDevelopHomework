//
//  TodoListTableViewCell.swift
//  myApp3
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 newbee. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    @IBOutlet weak var todoAvatar: UIImageView!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
