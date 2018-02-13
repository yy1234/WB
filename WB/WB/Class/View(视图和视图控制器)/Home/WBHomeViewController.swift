//
//  WBHomeViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
//全局变量一般设置成私有的
private let cellID="cellID"
class WBHomeViewController: WBBaseViewController {
    //懒加载一个数组
    lazy var stateList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpUI()
    }
  
    override func loadData() {
        for i in 0..<15 {
           stateList.insert(i.description, at: 0)
        }
        
    }
    //从写方法(不能在extetion中重写父类的方法)
    override func setUpUI() {
        super.setUpUI()
        //这样写会造成重复代码(其他页面也会用到类似的代码)
//        let btn = UIButton()
//        btn.setTitleColor(UIColor.darkGray, for: .normal)
//        btn.setTitleColor(UIColor.orange, for: .highlighted)
//        btn.setTitle("好友", for: .normal)
//        btn.addTarget(self, action: #selector(showFriend), for: .touchUpInside)
//        navigationItem.leftBarButtonItem=UIBarButtonItem.init(customView: btn)
        
//        navigationItem.leftBarButtonItem=UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(showFriend))
        
        navItem.leftBarButtonItem=UIBarButtonItem.init(title: "好友", target:self, action: #selector(showFriend))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    @objc func showFriend()->Void{
        // MARK: - 打印方法的名称
        print(#function)
        let vc = WBDemoViewController()
        //重复代码，容易忘记
//        vc.hidesBottomBarWhenPushed=true
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: -
extension WBHomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text=stateList[indexPath.row]
        return cell
    }
}
