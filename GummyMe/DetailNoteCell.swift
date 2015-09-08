//
//  DetailNotecell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class DetailNoteCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var wantButton: UIButton!
    @IBOutlet weak var wantCountLabel: UILabel!
    
    func configure(gummy: Gummy?) {
        guard let gummy = gummy else {
            return
        }
        
        if gummy.note != "" {
            commentLabel.text = gummy.note
        } else {
            commentLabel.text = "（まだコメントがないです）"
        }
        constructReview(gummy.review ?? 0)
    }
    
    private func constructReview(review: Int) {
        
        if review == -1 {
            reviewLabel.text = "評価 Not Yet"
            return
        }
        
        let reviewString: NSMutableString = NSMutableString()
        reviewString.appendString("\(review).0 ")
        for _ in 0..<review {
            reviewString.appendString("★")
        }
        
        reviewLabel.text = reviewString as String
    }

    
    @IBAction func wantButtonTouched(sender: AnyObject) {
    }
    
}
