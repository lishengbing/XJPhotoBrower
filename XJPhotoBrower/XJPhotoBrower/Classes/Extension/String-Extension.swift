//
//  String-Extension.swift
//  新增客户页
//
//  Created by MyLifeIsNotLost on 2017/5/23.
//  Copyright © 2017年 MyLifeIsNotLost. All rights reserved.
//

import UIKit

extension String{
    
    func transformToPinYin()->String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        return  string.replacingOccurrences(of: " ", with: "").capitalized
    }
}
