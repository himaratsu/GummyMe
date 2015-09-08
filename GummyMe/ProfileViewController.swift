//
//  ProfileViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let service = ProfileService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reload()
    }
    
    private func reload() {
        service.requestCountMyGummy { (count, error) -> Void in
            if let error = error {
                print("####error: \(error)")
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let profileCell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! ProfileCell
            return profileCell
        case 1:
            let eatGummyCell = tableView.dequeueReusableCellWithIdentifier("EatGummyCell") as! EatGummyCell
            eatGummyCell.configure(service.gummyCount)
            return eatGummyCell
        default:
            fatalError()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 135
        case 1:
            return 69
        default:
            return 0
        }
    }
    
    // MARL: - UITableViewDelegate
}
