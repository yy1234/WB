//
//  UIBarButtonItem+Extention.swift
//  WB
//
//  Created by yang'yang on 2018/2/11.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /// 便利构造函数，简化初始化控件使用的（一般）
    ///
    /// - Parameters:
    ///   - title: title
    ///   - target: target
    ///   - fontSize: fontSize  16号字体
    ///   - action: action
    convenience init(title:String,target:Any?,fontSize:CGFloat=16,action:Selector?,isBack:Bool=false){
        let btn = UIButton()
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action:(action)!, for: .touchUpInside)
        btn.titleLabel?.font=UIFont.systemFont(ofSize: fontSize)
        if isBack{
          btn.setImage(UIImage.init(named: "backImage"), for: .normal)
          btn.setTitle(title, for: .normal)
        }
        self.init(customView: btn)
        
    }
    
}
