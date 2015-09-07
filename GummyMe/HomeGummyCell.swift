//
//  HomeGummyCell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class HomeGummyCell: UITableViewCell {

    @IBOutlet weak var gummyImageView: UIImageView!
    @IBOutlet weak var gummyTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak private var footerView: UIView!
    @IBOutlet weak private var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        footerView.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 0.6)
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
    }
    
    func configure(gummy: Gummy) {
        if let imageUrl = gummy.imageUrl {
            gummyImageView.sd_setImageWithURL(NSURL(string: imageUrl))
        }
        
        gummyTitleLabel.text = gummy.type
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_us_POSIX")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        if let createdAt = gummy.createdAt {
            dateLabel.text = dateFormatter.stringFromDate(createdAt)
        }
        
        commentLabel.text = gummy.note
        
        userNameLabel.text = "名無しさん"
    }

    
    
}
