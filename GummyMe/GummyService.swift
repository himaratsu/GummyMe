//
//  GummyService.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit
import Parse

class GummyService: NSObject {
    
    var gummys = [Gummy]()
    
    func requestGummy(completionHandler:(([Gummy]?, NSError?) -> Void)) {
        
        let query = PFQuery(className: "Gummy")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            if let error = error {
                completionHandler(nil, error)
            } else {
                var gummys = [Gummy]()
                for result in results! as! [PFObject] {
                    let gummy = Gummy(pfObject: result)
                    gummys.append(gummy)
                }
                
                self.gummys = gummys
                completionHandler(gummys, nil)
            }
        }
        
    }

    func postGummy(gummyInfo: NewGummyInfo, completionHandler:((Bool, NSError?) -> Void)) {
        
        guard let type = gummyInfo.type else {
            completionHandler(false, NSError(domain: "type is not found", code: 2000, userInfo: nil))
            return
        }
        
        let gummy = PFObject(className: "Gummy")
        gummy["note"] = gummyInfo.note
        gummy["type"] = type
        gummy["review"] = gummyInfo.review
        if let image = gummyInfo.image,
            let imageData = UIImageJPEGRepresentation(image, 1) {
                let file = PFFile(data: imageData)
                gummy["image"] = file
        }
        
        gummy.saveInBackgroundWithBlock(completionHandler)
    }
    
    
}
