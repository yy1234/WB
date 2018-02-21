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
    var access_token:String? = "2.009ugrOG3mEohCac5d7d2d2f0bltVe"
    var uids:String? = ""
    
    
    func tokenRequest(method: WBHTTPMethod = .GET, URLString: String,parameters: [String: AnyObject]?,complation:@escaping (_ json:AnyObject?,_ isSusscess:Bool)->()) -> () {
        guard let token = access_token else {
            complation(nil,false)
            return
        }
        var parameters = parameters
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
         //parameters一定不为空,所以强行解包
        parameters!["access_token"] = token as AnyObject
        request(method: method, URLString: URLString, parameters: parameters!, complation: complation)
    }
    
    
    
    
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
                    print("token过期")
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
