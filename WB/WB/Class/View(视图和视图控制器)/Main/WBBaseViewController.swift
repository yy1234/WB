//
//  WBBaseViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    lazy var navigationBar = UINavigationBar.init(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 64+20 ))
    lazy var navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    
    }
    
    override var title: String?{
        didSet{
            navItem.title=title
        }
    }
    
     func setUpUI()->Void{
        view.backgroundColor=UIColor.randomColor()
        view.addSubview(navigationBar)
        navigationBar.items=[navItem]
        navigationBar.barTintColor=UIColor.HexClour(hexColor: 0xF6F6F6)
        navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.darkGray];
    }
 

}
