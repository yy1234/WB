//
//  WBNetWorkManger.swift
//  WB
//
//  Created by yang'yang on 2018/2/15.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
import Alamofire
//微博请求方式的,swift
enum WBHTTPMethod:String {
    case GET="GET"
    case POST="POST"
}
class WBNetWorkManger: NSObject {
    //实例化单例
    static let share=WBNetWorkManger()
    var result:AnyObject?
    
    func request(method: WBHTTPMethod = .GET, URLString: String,parameters: [String: AnyObject],complation:@escaping (_ json:AnyObject?,_ isSusscess:Bool)->()) {
        if method == .GET{
            Alamofire.request(URLString, method: .get,parameters: parameters).responseJSON { (returnResult:DataResponse) in
                if  returnResult.response?.statusCode==200{
                    let re=returnResult.value
                    self.result=re as AnyObject
                    complation(re as AnyObject,true)
                }else{
                    //发送通知，
                    if returnResult.response?.statusCode==403{
                        //token过期处理
                        return
                    }
                    let re=returnResult.value
                    self.result=re as AnyObject
                    complation(re as AnyObject,false)
                }
              
            }
        
        
        }else{
            Alamofire.request(URLString, method: .post,parameters: parameters).responseJSON { (returnResult) in
                complation(returnResult as AnyObject,false)
            }
        }
    

    }
    
}
