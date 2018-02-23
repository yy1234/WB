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
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        setUpChildController()
//        timerInvadute()
        delegate = self
        //添加中间的加好按钮
        let centerBtn=UIButton.init()
        centerBtn.backgroundColor=UIColor.orange
        centerBtn.frame=CGRect(x: 0, y: 0, width: 68, height: 68)
        tabBar.addSubview(centerBtn)
        let count = CGFloat(childViewControllers.count)
        let w = (tabBar.frame.size.width/count)
        
        //insetBy正数向内，负数向外
        centerBtn.frame=tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        centerBtn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
    }
    
    deinit {
        print("定时器销毁")
        timer?.invalidate()
        
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

  
    func timerInvadute(){
        if #available(iOS 10.0, *) {
            timer=Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { (time) in
                WBNetWorkManger.share.getUnreadCount(complation: { (count) in
                    self.tabBar.items?[0].badgeValue = ""
                    UIApplication.shared.applicationIconBadgeNumber=Int(count )!

                })
            })
        } else {
            // Fallback on earlier versions
        }
    }
   
}

// MARK: - UITabBarControllerDelegate代理
extension WBTabbarViewController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
  
        //1.拿到将要跳转的控制器,和当前的控制器作比较，是不是同一个控制器
        let currentNavIndex = tabBarController.selectedIndex
        let willSelectIndex = childViewControllers.index(of: viewController)
        //2.首页的tableView做滑动
        if currentNavIndex == willSelectIndex && currentNavIndex == 0{
            let Nav = childViewControllers[willSelectIndex!] as? WBNavMianController
            let vc = Nav?.childViewControllers[0] as! WBHomeViewController
            vc.tableView?.setContentOffset(CGPoint(x:0,y:-64), animated: true)
        }

    return viewController.isMember(of: WBNavMianController.self)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
         print("")
    }
    
}

