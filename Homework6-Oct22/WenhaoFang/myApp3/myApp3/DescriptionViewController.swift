//
//  DescriptionViewController.swift
//  myApp3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 newbee. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    

    @IBOutlet weak var todoItemTitle: UITextField!
    @IBOutlet weak var todoItemDesc: UITextField!
    
    var todoItemForEdit: todoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.todoItemTitle.text = todoItemForEdit?.title
        self.todoItemDesc.text = todoItemForEdit?.itemDescription
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        self.todoItemForEdit = todoItem(title: self.todoItemTitle.text, itemDescription: self.todoItemDesc.text)
    }
    
    

}
