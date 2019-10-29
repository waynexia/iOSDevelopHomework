//
//  DescriptionViewController.swift
//  myApp3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 newbee. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var todoItemTitle: UITextField!
    @IBOutlet weak var todoItemDesc: UITextField!
    @IBOutlet weak var todoItemImage: UIImageView!
    
    var todoItemForEdit: todoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.todoItemTitle.text = todoItemForEdit?.title
        self.todoItemDesc.text = todoItemForEdit?.itemDescription
        self.todoItemImage.image = todoItemForEdit?.todoAvatar
    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func changePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.todoItemImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        self.todoItemForEdit = todoItem(title: self.todoItemTitle.text, itemDescription: self.todoItemDesc.text, todoAvatar: todoItemImage.image)
    }
    
    

}
