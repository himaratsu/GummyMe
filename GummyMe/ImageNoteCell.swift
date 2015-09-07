//
//  ImageNoteCell.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit


protocol ImageNoteCellDelegate {
    func didTapImage()
    func didChangeNote(note: String)
}

class ImageNoteCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak private var thumbImageView: UIImageView!
    @IBOutlet weak private var textView: UITextView!
    
    var delegate: ImageNoteCellDelegate?
    
    var editingImage: UIImage? = nil {
        didSet {
            thumbImageView.image = editingImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        thumbImageView.layer.cornerRadius = 5
        thumbImageView.clipsToBounds = true
        textView.layer.cornerRadius = 5
        textView.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageViewTouched")
        thumbImageView.addGestureRecognizer(tapGesture)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func imageViewTouched() {
        delegate?.didTapImage()
    }
    
    
    // MARK: - UITextViewDelegate
    
    func textViewDidChange(textView: UITextView) {
        delegate?.didChangeNote(textView.text)
    }

}
