//
//  WBDemoViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/11.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title="第\(navigationController?.childViewControllers.count ?? 0)个"
    }

    override func setUpUI() {
        super.setUpUI()
        navigationItem.rightBarButtonItem=UIBarButtonItem.init(title: "下一个", style:.plain, target: self, action: #selector(showNext))
    }
    
    @objc func showNext(){
        
        navigationController?.pushViewController(WBDemoViewController(), animated: true)
    }
    
}
