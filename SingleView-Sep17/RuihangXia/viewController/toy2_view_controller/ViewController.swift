//
//  ViewController.swift
//  toy2_view_controller
//
//  Created by imac on 2019/9/24.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var
    welcomeLabel: UILabel!
    
    @IBOutlet weak var
    nameText: UITextField!
    
    @IBOutlet weak var
    passwordText: UITextField!
    
    @IBOutlet weak var
    saveButton: UIButton!
    
    @IBOutlet weak var
    hintLabel: UILabel!
    
    @IBAction func saveButtonClick(_ sender: Any){
        let username = nameText.text
        let password = passwordText.text
        
        if username == "Ruihang" && password == "123"{
            welcomeLabel.text = "Hello " + username! + " !"
            hintLabel.text = ""
        }
        else{
            hintLabel.text = "Incorrect message"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

