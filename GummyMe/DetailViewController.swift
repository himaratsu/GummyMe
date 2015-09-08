//
//  DetailViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak private var tableView: UITableView!
    var gummy: Gummy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("DetailImageCell") as! DetailImageCell
            cell.configure(gummy)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell") as! DetailNoteCell
            cell.configure(gummy)
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 320
        case 1:
            return 158
        default:
            return 0
        }
    }
    
}
