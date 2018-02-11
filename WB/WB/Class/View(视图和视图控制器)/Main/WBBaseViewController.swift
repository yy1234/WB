//
//  WBBaseViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }


     func setUpUI()->Void{
        view.backgroundColor=UIColor.randomColor()
    }
 

}
