//
//  UIBarButtonItem-Extension.swift
//  Chihiro
//
//  Created by 李胜兵 on 16/11/1.
//  Copyright © 2016年 chihiro. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    // 左边导航栏上方按钮
    convenience init(iamgeNameNormal : String, iamgeNameHighlighted : String, target : Any, action : Any) {
        let btn = UIButton()
        btn.setImage(UIImage(named: iamgeNameNormal), for: .normal)
        btn.setImage(UIImage(named: iamgeNameHighlighted), for: .highlighted)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        //btn.backgroundColor = UIColor.red
        btn.addTarget(target, action: action as! Selector, for: .touchUpInside)
        self.init(customView: btn)
    }
    
    // 左边导航栏上方按钮 -只有文字
    convenience init(titleLeft : String, target : Any, action : Any) {
        let btn = UIButton()
        btn.setTitle(titleLeft, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        //btn.backgroundColor = UIColor.red
        btn.addTarget(target, action: action as! Selector, for: .touchUpInside)
        self.init(customView: btn)
    }
    
    // 右边导航栏上方按钮
    convenience init(iamgeNameNormalRight : String, iamgeNameHighlightedRight : String, target : Any, action : Any) {
        let btn = UIButton()
        btn.setImage(UIImage(named: iamgeNameNormalRight), for: .normal)
        btn.setImage(UIImage(named: iamgeNameHighlightedRight), for: .highlighted)
        btn.sizeToFit()
        //btn.backgroundColor = UIColor.blue
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10)
        btn.addTarget(target, action: action as! Selector, for: .touchUpInside)
        self.init(customView: btn)
    }
    
    // 左边导航栏上方按钮 -只有文字
    convenience init(titleRight : String, target : Any, action : Any) {
        let btn = UIButton()
        btn.setTitle(titleRight, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10)
        //btn.backgroundColor = UIColor.red
        btn.addTarget(target, action: action as! Selector, for: .touchUpInside)
        self.init(customView: btn)
    }

}
