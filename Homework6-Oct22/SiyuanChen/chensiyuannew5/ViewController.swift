//
//  ViewController.swift
//  chensiyuannew5
//
//  Created by apple on 2019/9/24.
//  Copyright © 2019 hzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var welcomtext: UILabel!
    @IBOutlet weak var hint: UILabel!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitToIndex(segue: UIStoryboardSegue){}
    
    @IBAction func loginClick(_ sender: Any) {
        if let userName=username.text{	    
        welcomtext.text="welcome! "+userName
        }
        if ((username.text=="feng")&&(password.text=="123")){
            hint.isHidden=false
            hint.text="login successful"
        }else{
            hint.isHidden=false
            hint.text="login failed,please check your name and password"
        }
        }

}

