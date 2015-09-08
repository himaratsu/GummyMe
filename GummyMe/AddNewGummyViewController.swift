//
//  AddNewGummyViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

protocol AddNewGummyVCDelegate {
    func didSuccessNewTypeCreation(type: GummyType)
}

class AddNewGummyViewController: UIViewController, UITextFieldDelegate {

    private let service = GummyTypeService()
    var delegate: AddNewGummyVCDelegate?
    
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }

    @IBAction func submitButtonTouched(sender: AnyObject) {
        
        guard let newName = textField.text else {
            let alert = UIAlertController(title: "", message: "空では登録できません", preferredStyle: UIAlertControllerStyle.Alert)
            presentViewController(alert, animated: true, completion: nil)
            return
        }
    
        service.postGummyType(newName)
            { (isSuccess, error) -> Void in
            if let error = error {
                print("####error: \(error)")
            } else {
                if isSuccess {
                    self.delegate?.didSuccessNewTypeCreation(GummyType(typeId: "-", typeName: newName))
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        }
    }
    



}
