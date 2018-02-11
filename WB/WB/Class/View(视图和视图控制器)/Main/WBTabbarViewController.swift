//
//  WBTabbarViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        setUpChildController()
    }

}

//类似于OC中的分类，也可以用于代码区分
//可以你把功能相同的函数放入一个extention中
extension WBTabbarViewController{
    
    //设置子控制器
    private func setUpChildController(){
        let arry = [["className":"WBHomeViewController","title":"首页","imageName":"message"],
                    ["className":"WBMessageController","title":"消息","imageName":"address_book"],
                    ["className":"WBDiscoverController","title":"发现","imageName":"work"],
                    ["className":"WBProfileController","title":"我","imageName":"me"],
                    ]
        var VCArr = [UIViewController]()
        for dict in arry {
            VCArr.append(controller(dic: dict))
        }
        
        viewControllers = VCArr
        
    }
    
    /// 使用字典创建子控制器
    ///
    /// - Parameter dic: 信息字典[className,title,imageName]
    /// - Returns: 控制器
    private func controller(dic:[String:String])->UIViewController{
        guard let clsName = dic["className"],let image = dic["imageName"],let title = dic["title"],let VCClass = NSClassFromString( Bundle.main.nameSpace+"."+clsName)as?UIViewController.Type else {
            return UIViewController()
        }
        let VC=VCClass.init()
        VC.title=title
        VC.tabBarItem.image=UIImage.init(named: "tabbar_"+image)
        //按照原图预览
        VC.tabBarItem.selectedImage=UIImage.init(named: "tabbar_"+image+"_select")?.withRenderingMode(.alwaysOriginal)
        let nav = WBNavMianController.init(rootViewController:VC)
        return nav
    }
}


