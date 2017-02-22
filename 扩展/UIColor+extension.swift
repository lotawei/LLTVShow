//
//  UIColor+extension.swift
//  爱鲜蜂仿2次
//
//  Created by lotawei on 16/8/13.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
extension UIColor {
    
    class func colorWithCustom(_ r: CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(r, g: g, b: b)
    }
    //主题色
    class func applicationMainColor() -> UIColor {
        return UIColor(red: 238.0/255.0, green: 64.0/255.0, blue: 86.0/255.0, alpha:1)
    }
    
    //第二主题色
    class func applicationSecondColor() -> UIColor {
        return UIColor.lightGrayColor()
    }
    
    //警告颜色
    class func applicationWarningColor() -> UIColor {
        return UIColor(red: 0.1, green: 1.0, blue: 0.0, alpha: 1)
    }
    
    //链接颜色
    class func applicationLinkColor() -> UIColor {
        return UIColor(red: 59.0/255, green: 89.0/255.0, blue: 152.0/255.0, alpha:1)
    }
    
}
