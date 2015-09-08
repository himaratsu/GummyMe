//
//  GummyTypeService.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit
import Parse

class GummyTypeService: NSObject {

    var gummyTypes = [GummyType]()
    
    func requestGummyType(completionHandler:(([GummyType]?, NSError?) -> Void)) {
        
        let query = PFQuery(className: "GummyType")
        query.orderByDescending("name")
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            if let error = error {
                completionHandler(nil, error)
            } else {
                var gummyTypes = [GummyType]()
                for result in results! as! [PFObject] {
                    let gummy = GummyType(pfObject: result)
                    gummyTypes.append(gummy)
                }
                
                self.gummyTypes = gummyTypes
                completionHandler(gummyTypes, nil)
            }
        }
    }
    
    func postGummyType(name: String, completionHandler:((Bool, NSError?) -> Void)) {
        let gummy = PFObject(className: "GummyType")
        gummy["name"] = name
        gummy.saveInBackgroundWithBlock(completionHandler)
    }
    
}
