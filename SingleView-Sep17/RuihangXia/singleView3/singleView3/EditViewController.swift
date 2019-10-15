//
//  EditViewController.swift
//  singleView3
//
//  Created by imac on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var foodForEdit:food?
    var edit: Bool?
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var descInput: UITextField!
    @IBOutlet weak var starInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameInput.text = foodForEdit?.name
        self.descInput.text = foodForEdit?.desc
        if let star = foodForEdit?.star{
            self.starInput.text = String(star)
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        foodForEdit = food(name: self.nameInput.text, desc: self.descInput.text, star: Int32(self.descInput.text!))
    }
}
