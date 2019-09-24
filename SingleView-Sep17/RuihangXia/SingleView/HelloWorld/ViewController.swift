//
//  ViewController.swift
//  HelloWorld
//
//  Created by fengyuxiang on 2019/8/27.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var
    welcomeLabel: UILabel!
    
    @IBOutlet weak var
    nameText: UITextField!
    
    @IBOutlet weak var
    workText: UITextField!
    
    @IBOutlet weak var
    phoneText: UITextField!
    
    @IBOutlet weak var
    saveButton: UIButton!
    
    @IBAction func saveButtonClick(_ sender: Any){
        if let userName = nameText.text{
            welcomeLabel.text = "welcome " + userName
        }
        
        
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let initView = UIView(frame:CGRect(x:0,y:0,width:300,height :300))
//        initView.backgroundColor = UIColor(red: CGFloat(0xFF), green: CGFloat(0xFF), blue: CGFloat(0xCC), alpha: CGFloat(1.0))
//        self.view = initView
//        
//        
//        let secondView = UIView(frame:CGRect(x:0,y:0,width:200,height :200))
//        secondView.backgroundColor = UIColor.red
//        self.view.addSubview(secondView)
//
//        
//        let labelView = UILabel(frame:CGRect(x:0,y:0,width:100,height :100))
//        labelView.text = "hello world"
//        labelView.backgroundColor = UIColor.blue
//        self.view.addSubview(labelView)
//        
//        UIView.animate(withDuration: 1){
//            var transformTranslate = secondView.transform
//            transformTranslate = transformTranslate.translatedBy(x: 100, y: 100)
//            secondView.transform = transformTranslate
//        }
//        
//        UIView.animate(withDuration: 1){
//            var transformRotate = labelView.transform
//            transformRotate = transformRotate.rotated(by: CGFloat(Double.pi / 4))
//            labelView.transform = transformRotate
//        }
//        
//        

    }

    

}

