//
//  DetailImageCell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class DetailImageCell: UITableViewCell {

    @IBOutlet weak var gummyImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        footerView.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 0.6)
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 17.5
    }
    
    func configure(gummy: Gummy?) {
        
        guard let gummy = gummy else {
            return
        }
        
        if let imageUrl = gummy.imageUrl {
            gummyImageView.sd_setImageWithURL(NSURL(string: imageUrl))
        }
        
        userNameLabel.text = "名無しさん"
        
        if let createdAt = gummy.createdAt {
            dateLabel.text = createdAt.toSimpleFormatString()
        }
        
        
    }
}
