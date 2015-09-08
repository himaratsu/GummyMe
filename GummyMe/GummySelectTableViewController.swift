//
//  GummySelectTableViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

protocol GummySelectTableViewControllerDelegate {
    func didSelectGummyType(type: String)
}

class GummySelectTableViewController: UITableViewController, AddNewGummyVCDelegate {

    private let service = GummyTypeService()
    
    var delegate: GummySelectTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reload()
    }
    
    private func reload() {
        service.requestGummyType { (gummyTypes, error) -> Void in
            if let error = error {
                print("##### error: \(error)")
            } else {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return service.gummyTypes.count
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCellWithIdentifier("AddNewCell")!
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("GummyTypeCell")!
            cell.textLabel?.text = service.gummyTypes[indexPath.row].typeName
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 1:
            delegate?.didSelectGummyType(service.gummyTypes[indexPath.row].typeName)
            self.navigationController?.popViewControllerAnimated(true)
        default: ()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showNewGummyType" {
            let destVC = segue.destinationViewController as! AddNewGummyViewController
            destVC.delegate = self
        }
    }
    
    
    // MARK: - AddNewGummyVCDelegate
    
    func didSuccessNewTypeCreation(type: GummyType) {
        delegate?.didSelectGummyType(type.typeName)
    }
    
}
