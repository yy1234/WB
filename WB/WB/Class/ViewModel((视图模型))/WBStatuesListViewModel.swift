//
//  WBStatuesListViewModel.swift
//  WB
//
//  Created by yang'yang on 2018/2/18.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
import Alamofire
///父类的选择

/*
 -如果需要使用KVC或者字典转模型，类就需要继承NSObject
 -如果只是写一些方法，可以不继承父类。会使得类更加的轻量
 
 //使命，负责微博的数据处理，
 1.字典转模型
 2.下拉/上拉，刷新数据
 */

class WBStatuesListViewModel{
    lazy var statusList=[WBStatueModel]()
    //设置下拉，最大的允许错误
    private var max_refreshCount = 3
    private var refreshCount:Int=0
    func getStatusListModel(isPullUp:Bool,complation:@escaping (_ isSuccess:Bool,_ isNeedRefresh:Bool)->()) {
        if isPullUp && refreshCount>max_refreshCount {
            complation(false,false)
        }
        //上拉刷新，since_id传值为0
        let since_id:Int64 = isPullUp ? 0:(statusList.first?.wb_id ?? 0)
        let max_id:Int64 = isPullUp ? (statusList.last?.wb_id ?? 0) : 0
        WBNetWorkManger.share.stateRequest(since_id:since_id , max_id:max_id) { (list, isSussess) in
          //1.字典转模型
            guard  let arr = NSArray.yy_modelArray(with: WBStatueModel.self, json: list ?? []) as? [WBStatueModel] else{
                 complation(false,false)
                return
            }
            
            if isPullUp && arr.count==0{
                self.refreshCount+=1
                 complation(false,false)
            }
            self.statusList = arr + self.statusList
            complation(isSussess,true)
           
        }
    }
    
}
