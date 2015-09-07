//
//  ReviewCell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

protocol ReviewCellDelegate {
    func didSelectReview(star: Int)
}

class ReviewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak private var textField: UITextField!
    var delegate: ReviewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text,
            let star = Int(text) {
            delegate?.didSelectReview(star)
        } else {
            print("star not number")
        }
    }

}
