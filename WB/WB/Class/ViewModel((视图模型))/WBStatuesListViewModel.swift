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
    var since_id:Int64?
    func getStatusListModel(complation:@escaping (_ isSuccess:Bool)->()) {
        since_id = statusList.first?.wb_id
        WBNetWorkManger.share.stateRequest(since_id:since_id ?? 0, max_id:0) { (list, isSussess) in
          //1.字典转模型
//            let arr =  try? JSONSerialization.data(withJSONObject: list, options: .prettyPrinted)
            guard  let arr = NSArray.yy_modelArray(with: WBStatueModel.self, json: list ?? []) as? [WBStatueModel] else{
                complation(isSussess)
                return
            }
            self.statusList = arr + self.statusList
            complation(isSussess)
           

        }
    }
    
}
