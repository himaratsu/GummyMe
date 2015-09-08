//
//  TabViewController.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/07.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let targetIndex = viewControllers?.indexOf(viewController)
        if targetIndex == 1 {
            let newGummyVC = NewGummyViewController.createViewControllerWithNavigation()
            self.presentViewController(newGummyVC, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
