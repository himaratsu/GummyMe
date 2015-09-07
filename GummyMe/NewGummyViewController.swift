//
//  NewGummyViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class NewGummyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
ImageNoteCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
GummySelectTableViewControllerDelegate, ReviewCellDelegate {

    @IBOutlet weak private var tableView: UITableView!
    private var newGummyInfo = NewGummyInfo()
    private var editingImage: UIImage?
    private let gummyService = GummyService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func showPickerView() {
        let alert = UIAlertController(title: "画像を選択",
            message: nil,
            preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            alert.addAction(UIAlertAction(title: "カメラで撮影する",
                style: .Default,
                handler: { (action) -> Void in
                    self.showCameraPicker()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "ライブラリから読み込む",
            style: .Default,
            handler: { (action) -> Void in
                self.showPhotolibraryPicker()
        }))
        
        alert.addAction(UIAlertAction(title: "キャンセル",
            style: UIAlertActionStyle.Cancel,
            handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    private func showCameraPicker() {
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .Camera
        pickerViewController.delegate = self
        presentViewController(pickerViewController, animated: true, completion: nil)
    }
    
    private func showPhotolibraryPicker() {
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .PhotoLibrary
        pickerViewController.delegate = self
        presentViewController(pickerViewController, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("SelectCell") as! SelectTypeCell
            cell.configure(newGummyInfo.type)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ImageNoteCell") as! ImageNoteCell
            cell.delegate = self
            cell.editingImage = editingImage
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("ReviewCell") as! ReviewCell
            cell.delegate = self
            return cell
        default:
            return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 1:
            return 111
        case 2:
            return 60
        default:()
            return 0
        }
    }
    
    // MARK: - UITableViewDelegate

    
    
    // MARK: - Action

    @IBAction func postButtonTouched(sender: AnyObject) {
        print("投稿")
        gummyService.postGummy(newGummyInfo) { (isSuccess, error) -> Void in
            if isSuccess {
                print("post success!")
            } else {
                print("error! \(error)")
            }
        }
    }

    @IBAction func cancelButtonTouched(sender: AnyObject) {
        print("キャンセル")
    }
    
    
    // MARK: - Initialize
    
    class func createViewController() -> NewGummyViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("NewGummyViewController") as! NewGummyViewController
    }
    
    
    // MARK: - ImageNoteCellDelegate
    
    func didTapImage() {
        showPickerView()
    }
    
    func didChangeNote(note: String) {
        print("##note = \(note)")
        newGummyInfo.note = note
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        editingImage = image
        newGummyInfo.image = image
        tableView.reloadData()
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - GummySelectTableViewControllerDelegate
    
    func didSelectGummyType(type: String) {
        newGummyInfo.type = type
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSelectType" {
            let destVC =  segue.destinationViewController as! GummySelectTableViewController
            destVC.delegate = self
        }
    }
    
    
    // MARK: - ReviewCellDelegate
    
    func didSelectReview(star: Int) {
        newGummyInfo.review = star
    }
}
