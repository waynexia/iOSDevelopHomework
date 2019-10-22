//
//  todoItem.swift
//  myApp3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 newbee. All rights reserved.
//

import Foundation

class todoItem: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "titleKey")
        aCoder.encode(itemDescription, forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "titleKey") as? String
        itemDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
    }
    
    var title: String?
    var itemDescription: String?
    
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("todoList")
    
    init(title: String?, itemDescription: String?) {
        self.title = title
        self.itemDescription = itemDescription
    }
}
