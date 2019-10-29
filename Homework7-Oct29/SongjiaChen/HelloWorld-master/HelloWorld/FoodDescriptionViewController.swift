//
//  FoodDescriptionView.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class FoodDescriptionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodDescription: UITextField!
    @IBOutlet weak var foodImage: UIImageView!
    
    
    var foodForEdit: food?
    var newPage: Bool = false
    var newFood: food?     // update or add

    @IBAction func camaraBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func clickImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.foodName.text = foodForEdit?.foodName
        self.foodDescription.text = foodForEdit?.foodDescription
        self.foodImage.image = foodForEdit?.foodAvatar
    
        if(self.foodName.text == "" && self.foodDescription.text == "") {
            self.newPage = true
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 退出当前页面之后，切换到其他页面之前调用该函数
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(!(self.foodName.text == "") || !(self.foodDescription.text == "" || !(self.foodImage.image == nil))){
            self.newFood = food(foodName: self.foodName.text,
                              foodDescription: self.foodDescription.text,
                              foodAvatar: self.foodImage.image)
        }
    }
}
