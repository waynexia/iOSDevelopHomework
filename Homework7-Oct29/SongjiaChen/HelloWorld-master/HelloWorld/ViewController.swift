//
//  ViewController.swift
//  HelloWorld
//
//  Created by fengyuxiang on 2019/8/27.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func loginBtnClick(_ sender: Any) {
        var check = false
        if let username = nameInput.text{
            if username == "song" {
                if let password = passwordInput.text{
                    if password == "song" {
                        check = true
                    }
                }
            }
        }
        if(check){
            if let username = nameInput.text{
                welcomeLabel.text = "Hi " + username
            }
        }
        
        
        
    }
    
    // 设置页面统一退出到这里
    @IBAction func exitToHere(segue: UIStoryboardSegue){
        print("回到'我的'界面")
    }
    
}

