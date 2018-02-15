//
//  WBBaseViewController.swift
//  WB
//
//  Created by yang'yang on 2018/2/7.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
import SnapKit
/// oc中没有多继承，处理的方式，是通过协议
///swift中的写法，更像多继承
class WBBaseViewController: UIViewController {
    var tableView:UITableView?
    var userLogon = false
    
    var refreashController:UIRefreshControl?
    var isPushing:Bool=false
    lazy var navigationBar = UINavigationBar.init(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 64+20 ))
    lazy var navItem = UINavigationItem()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    //重写title的set方法
    override var title: String?{
        didSet{
            navItem.title=title
        }
    }
    
    @objc func loadData() {
        //子类不实现方法，关闭刷新
        refreashController?.endRefreshing()
    }
    
     func setUpUI()->Void{
        view.backgroundColor=UIColor.randomColor()
        setNavBar()
        userLogon ? setTableView():setVisterView()
     
    }
 
    //设置表格视图
    private func setTableView(){
        tableView=UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate=self
        tableView?.dataSource=self
        tableView?.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentBehavior.never
        //防止被自定义的bar挡住
        view.insertSubview(tableView!, belowSubview: navigationBar)
        //设置tableView的偏移量
        tableView?.contentInset=UIEdgeInsetsMake(navigationBar.bounds.height-20, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        
        refreashController=UIRefreshControl()
        tableView?.addSubview(refreashController!)
        refreashController?.addTarget(self, action: #selector(loadData), for: .valueChanged)
     
    }
    
    //设置访客视图
    private func setVisterView(){
        let visterView = WBVisterView.init(frame: view.bounds)
        view.insertSubview(visterView, belowSubview: navigationBar)
        
    }
   
    
    private func setNavBar(){
        view.addSubview(navigationBar)
        navigationBar.items=[navItem]
        
        //        navigationBar.barTintColor=UIColor.HexClour(hexColor: 0xF6F6F6)
        //设置标题颜色
        navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.darkGray];
    }
}


// MARK: - tableview代理实现
extension WBBaseViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    //判断是否是最后一行，做下拉刷新操作
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let section = tableView.numberOfSections-1
        let row = tableView.numberOfRows(inSection: section)
        if (section<0 || row<0) {
            return
        }
        if row-1==indexPath.row && !isPushing {
            loadData()
           isPushing=true
        }
        
    }
}



