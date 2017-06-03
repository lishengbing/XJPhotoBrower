//
//  UIButton-Extension.swift
//  Mortgage
//
//  Created by 祝丹 on 2017/5/17.
//  Copyright © 2017年 善林(中国)金融信息服务有限公司. All rights reserved.
//

import UIKit

extension UIButton {
    class func footCommitBtn(title: String,target: Any?,action:Selector) -> UIButton{
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 55, y: 20, width: kScreenW - 110, height: 38)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.4349445105, blue: 0.0775686875, alpha: 1)
        btn.layer.cornerRadius = 3
        btn.layer.masksToBounds = true
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
}
