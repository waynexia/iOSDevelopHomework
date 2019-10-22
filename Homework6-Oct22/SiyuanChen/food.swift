//
//  food.swift
//  chensiyuannew5
//
//  Created by apple on 2019/10/15.
//  Copyright © 2019 hzk. All rights reserved.
//

import Foundation

class food: NSObject,NSCoding{
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(description_,forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name=aDecoder.decodeObject(forKey:"nameKey") as? String
        description_=aDecoder.decodeObject(forKey:"descriprionKey") as? String
    }
    
    
    var name: String?
    var description_: String?
    
    static let DocumentsDirectory=FileManager().urls(for:.documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodlist")
    
    init(name:String?,description_:String?){
        self.name=name
        self.description_=description_
        
    }
}
