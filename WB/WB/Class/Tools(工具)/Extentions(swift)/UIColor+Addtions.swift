//
//  UIColor+Addtions.swift
//  GroupV
//
//  Created by yang'yang on 2018/1/17.
//  Copyright © 2018年 Lordar. All rights reserved.
//

import UIKit
extension UIColor{
    class func HexClour(hexColor:Int32)->UIColor{
        let r = CGFloat(((hexColor & 0x00FF0000) >> 16)) / 255.0
        let g = CGFloat(((hexColor & 0x0000FF00) >> 8)) / 255.0
        let b = CGFloat(hexColor & 0x000000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
