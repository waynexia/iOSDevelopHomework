//
//  todoItem.swift
//  myApp3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 newbee. All rights reserved.
//

import Foundation
import UIKit

class todoItem: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "titleKey")
        aCoder.encode(itemDescription, forKey: "descriptionKey")
        aCoder.encode(todoAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "titleKey") as? String
        itemDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
        todoAvatar = aDecoder.decodeObject(forKey: "avatarKey") as? UIImage
    }
    
    var title: String?
    var itemDescription: String?
    var todoAvatar: UIImage?
    
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("todoList")
    
    init(title: String?, itemDescription: String?, todoAvatar: UIImage?) {
        self.title = title
        self.itemDescription = itemDescription
        self.todoAvatar = todoAvatar
    }
}
