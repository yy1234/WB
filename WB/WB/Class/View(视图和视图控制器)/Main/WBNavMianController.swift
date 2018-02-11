//
//  WBNavMianController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBNavMianController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       
        //统一在基类里面隐藏bar,根控制器不计入childViewControllers的数量里面
        if childViewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed=true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
