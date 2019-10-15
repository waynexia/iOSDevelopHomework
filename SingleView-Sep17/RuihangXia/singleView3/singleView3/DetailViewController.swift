//
//  DetailViewController.swift
//  singleView3
//
//  Created by imac on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var foodForEdit:food?
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var descText: UILabel!
    @IBOutlet weak var starText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameText.text = foodForEdit?.name
        self.descText.text = foodForEdit?.desc
        self.starText.text = String((foodForEdit?.star)!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let editVC = segue.destination as? EditViewController{
            editVC.foodForEdit = foodForEdit
            editVC.edit = true
        }
    }

}
