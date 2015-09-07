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
    
    func configure(gummy: Gummy?) {
        guard let gummy = gummy else {
            return
        }
        
        commentLabel.text = gummy.note
    }
}
