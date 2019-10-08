//
//  ViewController.swift
//  myApp2
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 newbee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isLogin = false
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBAction func LoginClick(_ sender: Any) {
        if !isLogin {
            if let username = usernameInput.text {
                if username == "whfang" {
                    if let password = passwordInput.text {
                        if password == "123456" {
                            isLogin = !isLogin
                            welcomeText.text = "Hello, " + username
                        } else {
                            welcomeText.text = "password error"
                        }
                    }
                } else {
                    welcomeText.text = "username error"
                }
            }
        }

    }
    @IBAction func LogoutClick(_ sender: Any) {
        if isLogin {
            isLogin = !isLogin
            welcomeText.text = "Hello, Stranger"
            usernameInput.text = ""
            passwordInput.text = ""
        }
    }
    @IBAction func eixitToHome(segue: UIStoryboardSegue) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

