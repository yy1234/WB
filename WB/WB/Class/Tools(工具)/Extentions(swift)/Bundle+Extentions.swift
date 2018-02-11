//
//  Bundle+Extentions.swift
//  WB
//
//  Created by yang'yang on 2018/2/11.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import Foundation
extension Bundle{
    var nameSpace:String {
        return (infoDictionary?["CFBundleName"] as?String) ?? ""
    }
    
}
