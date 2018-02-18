//
//  WBNetWorkManger+Extention.swift
//  WB
//
//  Created by yang'yang on 2018/2/17.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import Foundation
//再次封装WBNetWorkManger，这一层只关心返回结果
extension WBNetWorkManger{
    func stateRequest(complation:@escaping (_ json:AnyObject?,_ isSusscess:Bool)->()){
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        let  parameters = ["access_token":"2.009ugrOG3mEohCac5d7d2d2f0bltVe"] as [String : AnyObject]
        request(URLString: urlString, parameters: parameters) { (jsonss, isSusscess) in
            
//            guard  let resultDic = json as? [String:AnyObject] else{
//                complation(nil,isSusscess)
//                return
//            }
//            let resultDic = json as? [String:AnyObject]
            //mutableContainers
//            let results=try? JSONSerialization.jsonObject(with: (jsonss as! NSData) as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let result = jsonss!["statuses"]
            complation(result as AnyObject,isSusscess)
            
            }
    }
    
    
}
