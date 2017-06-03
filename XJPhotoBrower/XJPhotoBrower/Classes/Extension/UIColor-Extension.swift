//
//  UIColor-Extension.swift
//  Chihiro
//
//  Created by 李胜兵 on 16/11/1.
//  Copyright © 2016年 chihiro. All rights reserved.
//!
import UIKit

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func random() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
    }
    
    
    func getImage(frame : CGRect) -> UIImage {
        var image : UIImage!
        let view = UIView(frame: frame)
        view.backgroundColor = self
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        view.layer.render(in: context)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
