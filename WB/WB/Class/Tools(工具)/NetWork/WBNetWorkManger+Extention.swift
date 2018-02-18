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
        tokenRequest(URLString: urlString, parameters: nil) { (jsonss, isSusscess) in
            let result = jsonss!["statuses"]
            complation(result as AnyObject,isSusscess)
        }
    }
    
    
}
