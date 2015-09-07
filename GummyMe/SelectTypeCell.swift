//
//  SelectTypeCell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class SelectTypeCell: UITableViewCell {

    @IBOutlet weak private var selectButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectButton.layer.cornerRadius = 5
        selectButton.clipsToBounds = true
    }

    func configure(gummyType: String?) {
        if let gummyType = gummyType {
            selectButton.setTitle(gummyType, forState: .Normal)
        } else {
            selectButton.setTitle("グミを選択", forState: .Normal)
        }
    }
}
