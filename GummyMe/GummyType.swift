//
//  GummyType.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import Foundation
import Parse

class GummyType {
    
    var typeId: String
    var typeName: String
    
    init(typeId: String, typeName: String) {
        self.typeId = typeId
        self.typeName = typeName
    }
    
    init(pfObject: PFObject) {
        self.typeId = pfObject.objectId!
        self.typeName = pfObject["name"] as! String
    }
}
