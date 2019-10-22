//
//  food.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import Foundation
class food: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodName, forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodName = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
    }
 
    var foodName: String?
    var foodDescription: String?
    
    // add document path
    static let DocumentsDirectory = FileManager()
        .urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(foodName: String?, foodDescription: String?){
        self.foodName = foodName
        self.foodDescription = foodDescription
    }
}

