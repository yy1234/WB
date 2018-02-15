//
//  WBVisterView.swift
//  WB
//
//  Created by yang'yang on 2018/2/13.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

import UIKit

class WBVisterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy  var imageView=UIImageView.init()


}

extension WBVisterView{
    func setUpUI() {
        backgroundColor=UIColor.white
        imageView.image=UIImage.init(named: "ddd")
    }

}
