//
//  NSMutableAttributedString-Extension.swift
//  Mortgage
//
//  Created by 祝丹 on 2017/5/18.
//  Copyright © 2017年 善林(中国)金融信息服务有限公司. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    class func someColorSizeStr(colorRang: NSRange,color: UIColor, sizeRang: NSRange, size:CGFloat, str: String) -> NSMutableAttributedString {
        let attributeStr = NSMutableAttributedString(string: str)
        attributeStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: size), range: sizeRang)
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: color, range: colorRang)
        return attributeStr
    }
}
