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

class GummySelectTableViewController: UITableViewController {

    var delegate: GummySelectTableViewControllerDelegate?
    var gummyTypes = ["SOURS グレープ", "Pureグミ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            return gummyTypes.count
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
            cell.textLabel?.text = gummyTypes[indexPath.row]
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectGummyType(gummyTypes[indexPath.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
