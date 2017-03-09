//
//  FingersettingModel.swift
//  FingerLock
//
//  Created by Zzcz on 2017/3/8.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class FingersettingModel: NSObject {

    var isok = false //是否设置 false 未设置 true 设置使用
    var title = "" //文字描述
    
    //静态key数组 
    static let protertise = ["isok","title"]
    
    //构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        for key in FingersettingModel.protertise {
            if dict[key] != nil {
                setValue(dict[key], forKey: key)
            }
        }
    }
    

}
