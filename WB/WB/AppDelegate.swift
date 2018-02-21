//
//  AppDelegate.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //使用#available判断使用的系统版本
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.carPlay,.badge]) { (isSussEess, error) in
                print("授权" + (isSussEess ? "成功":"失败"))
            }
        } else {
            // Fallback on earlier versions
            let notificationSettings = UIUserNotificationSettings(types: [.badge,.sound,.alert], categories: nil)
            application.registerUserNotificationSettings(notificationSettings)
        }
      
        
        let size = UIScreen.main.bounds
        window=UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        window?.rootViewController=WBTabbarViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

