//
//  Gummy.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit
import Parse

class Gummy: NSObject {

    let gummyId: String
    var note: String?
    var imageUrl: String?
    var type: String?
    var createdAt: NSDate?
    var updatedAt: NSDate?
    
    init(gummyId: String) {
        self.gummyId = gummyId
        super.init()
    }
    
    init(pfObject: PFObject) {
        self.gummyId = pfObject.objectId!
        self.note = pfObject["note"] as? String
        
        if let image = pfObject["image"] as? PFFile {
            self.imageUrl = image.url
            print(self.imageUrl)
        }
        
        self.type = pfObject["type"] as? String
        self.createdAt = pfObject.createdAt
        self.updatedAt = pfObject.updatedAt
    }
}
