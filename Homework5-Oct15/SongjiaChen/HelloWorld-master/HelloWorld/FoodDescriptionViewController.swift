//
//  FoodDescriptionView.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class FoodDescriptionViewController: UIViewController {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodDescription: UITextField!
    var foodForEdit: food?
    var newPage: Bool = false
    var newFood: food?     // update or add

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.foodName.text = foodForEdit?.name
        self.foodDescription.text = foodForEdit?.description
        
        if(self.foodName.text == "" && self.foodDescription.text == "") {
            self.newPage = true
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(!(self.foodName.text == "") || !(self.foodDescription.text == "")){
            self.newFood = food(name: self.foodName.text, description: self.foodDescription.text)
        }
    }
}
