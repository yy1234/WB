//
//  WBTabbarViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBTabbarViewController: UITabBarController {
//    var centerBtn:UIButton
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        setUpChildController()
       
        
        //添加中间的加好按钮
        let centerBtn=UIButton.init()
        centerBtn.backgroundColor=UIColor.orange
        centerBtn.frame=CGRect(x: 0, y: 0, width: 68, height: 68)
        tabBar.addSubview(centerBtn)
        let count = CGFloat(childViewControllers.count)
        let w = (tabBar.frame.size.width/count)-1
        
        //insetBy正数向内，负数向外
        centerBtn.frame=tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        centerBtn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
    }
    
    @objc func centerBtnClick(){
        print("撰写微博")
        
        let nav = UINavigationController.init(rootViewController: UIViewController())
        self.present(nav, animated: true, completion: nil)
        
    }
    
    /// 设备支持方向，用代码的好处是可以在需要横屏的时候，单独处理
    //设置横屏以后当前的控制器，及其子控制器都是会横屏
    //本地播放视屏的时候，通过model出来
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}


//类似于OC中的分类，也可以用于代码区分
//可以你把功能相同的函数放入一个extention中
extension WBTabbarViewController{
    //设置子控制器
    private func setUpChildController(){
        let arry = [["className":"WBHomeViewController","title":"首页","imageName":"message"],
                    ["className":"WBMessageController","title":"消息","imageName":"address_book"],
                    ["className":"UIViewController"],
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
        //创建控制器
        let VC=VCClass.init()
        VC.title=title
        //设置图片
        VC.tabBarItem.image=UIImage.init(named: "tabbar_"+image)
          //按照原图预览
        VC.tabBarItem.selectedImage=UIImage.init(named: "tabbar_"+image+"_select")?.withRenderingMode(.alwaysOriginal)
        let nav = WBNavMianController.init(rootViewController:VC)
        
        //设置字体
        VC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.HexClour(hexColor: 0x5da8de)], for: .highlighted)
        
        //修改item的字体大小，并且只能在normal模式下
        VC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .normal)
        
        return nav
    }
    
  
  
}



