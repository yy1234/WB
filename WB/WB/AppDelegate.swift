//
//  AppDelegate.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let size = UIScreen.main.bounds
        window=UIWindow(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        window?.rootViewController=WBTabbarViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

