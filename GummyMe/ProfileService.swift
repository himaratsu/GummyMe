//
//  ProfileService.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit
import Parse

class ProfileService: NSObject {

    var gummyCount: Int32 = 0
    
    func requestCountMyGummy(completionHandler:((Int32?, NSError?) -> Void)) {
        
        let query = PFQuery(className: "Gummy")
//        query.whereKey(<#T##key: String##String#>, containedIn: <#T##[AnyObject]#>) equal "me"
        query.countObjectsInBackgroundWithBlock({ (count, error) -> Void in
            if let error = error {
                completionHandler(nil, error)
            } else {
                self.gummyCount = count
                completionHandler(count, nil)
            }
        })
    }
    
    func postGummyType(name: String, completionHandler:((Bool, NSError?) -> Void)) {
        let gummy = PFObject(className: "GummyType")
        gummy["name"] = name
        gummy.saveInBackgroundWithBlock(completionHandler)
    }
    
    
}
