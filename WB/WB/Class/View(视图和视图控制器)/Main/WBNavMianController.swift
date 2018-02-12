//
//  WBNavMianController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBNavMianController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       
        //统一在基类里面隐藏bar,根控制器不计入childViewControllers的数量里面
        if childViewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed=true
            var title1 = "返回"
            if childViewControllers.count==1{
              title1=childViewControllers.first?.title ?? "返回"
            }
            //类似与isKindClass
            if let VC = viewController as? WBBaseViewController{
                VC.navItem.leftBarButtonItem=UIBarButtonItem.init(title: title1, target: self, action: #selector(popToParent),isBack:true)
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    @objc func popToParent() {
        popViewController(animated: true)
    }
}
