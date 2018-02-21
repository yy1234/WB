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
    func stateRequest(since_id:Int64=0,max_id:Int64=0,complation:@escaping (_ json:AnyObject?,_ isSusscess:Bool)->()){
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        let parameters = ["since_id":since_id,
                          "max_id":max_id]
        tokenRequest(URLString: urlString, parameters: parameters as [String : AnyObject]) { (jsonss, isSusscess) in
            let result = jsonss!["statuses"]
            complation(result as AnyObject,isSusscess)
        }
    }
    
    
}
