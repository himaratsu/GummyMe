//
//  Util.swift
//  GummyMe
//
//  Created by 平松　亮介 on 2015/09/08.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import Foundation

extension NSDate {
    func toSimpleFormatString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_us_POSIX")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.stringFromDate(self)
    }
}
