//
//  WBStatuesListModel.swift
//  WB
//
//  Created by yang'yang on 2018/2/18.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit
import Foundation
import YYModel
class WBStatuesListModel: NSObject {
    //Int在64位机器上，默认64，32机器上默认32，不写Int64会造成数据溢出
    var id: Int64 = 0
    var text: String = ""
    override var description: String{
        return yy_modelDescription()
    }
    
}
