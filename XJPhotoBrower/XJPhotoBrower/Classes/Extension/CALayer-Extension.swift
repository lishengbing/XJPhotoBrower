//
//  CALayer-Extension.swift
//  Mortgage
//
//  Created by 朱小祥 on 2017/5/17.
//  Copyright © 2017年 善林(中国)金融信息服务有限公司. All rights reserved.
//

import UIKit

extension CALayer {
    var borderColorWithUIColor:UIColor {
        set(color) {
            self.borderColor = color.cgColor
        }
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}
