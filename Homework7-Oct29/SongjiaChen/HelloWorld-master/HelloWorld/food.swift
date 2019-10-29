//
//  food.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import Foundation
import UIKit            // UIImage
class food: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodName, forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey")
        aCoder.encode(foodAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodName = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey: "avatarKey") as? UIImage
    }
 
    var foodName: String?
    var foodDescription: String?
    var foodAvatar: UIImage?
    
    // add document path
    static let DocumentsDirectory = FileManager()
        .urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodListNew")
    
    init(foodName: String?, foodDescription: String?, foodAvatar: UIImage?){
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.foodAvatar = foodAvatar
    }
}

