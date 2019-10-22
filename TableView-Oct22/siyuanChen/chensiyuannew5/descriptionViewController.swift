//
//  descriptionViewController.swift
//  chensiyuannew5
//
//  Created by apple on 2019/10/15.
//  Copyright © 2019 hzk. All rights reserved.
//

import UIKit

class descriptionViewController: UIViewController {

    @IBOutlet weak var descriptionText:UITextField!
    @IBOutlet weak var nameText:UITextField!
    

    
    
    var foodForEdit:food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameText.text=foodForEdit?.name
        self.descriptionText.text=foodForEdit?.description
        self.navigationItem.title=foodForEdit?.name
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        foodForEdit=food(name: self.nameText.text, description: self.descriptionText.text)
    }
}
