//
//  UIView-Extension.swift
//  Chihiro
//
//  Created by point on 2016/11/17.
//  Copyright © 2016年 chihiro. All rights reserved.
//

import UIKit

extension UIView {
    
    // x
    var x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    
    
    
    var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        
        get {
            return center.y
        }
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    
    class func widthToSix(width:CGFloat)->(CGFloat) {
        let iphone6Width = CGFloat(375)
        return width*kScreenW/iphone6Width
    }
 
    
    // MARK: ----上下间距比例：相对于6 上的高度比例  375(750) - 667(1334)  公式：  h6(原型图) / H6(屏幕) = h?(计算的) / kScreenH
    class func paddingVerticalScaleToSixHeight(h: CGFloat) -> CGFloat {
        let iphone6Height = CGFloat(667)
        return kScreenH * h / iphone6Height
    }

}


extension UIView {
    func viewController() -> UIViewController? {
        //通过响应者链，取得此视图所在的视图控制器
        var nextVC = self.next
        
        while(nextVC != nil) {
            //判断响应者对象是否是视图控制器类型
            if (nextVC?.isKind(of: UIViewController.self))! {
                return nextVC as? UIViewController
            }
            
            nextVC = nextVC?.next
        }
        return nil;
    }
}
