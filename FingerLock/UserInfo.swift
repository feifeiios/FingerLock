//
//  UserInfo.swift
//  FingerLock
//
//  Created by Zzcz on 2017/3/8.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit
import LocalAuthentication
class UserInfo: NSObject {
    //设置指纹解锁
    static func setLockWithFingerPrintOn(isOn: Bool) -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let device : String = UIDevice.currentDevice().systemVersion
        let dou:Double = (device as NSString).doubleValue
        var newIsOn = isOn
        if dou <= 8 {
            newIsOn = false
        }
        let ctx = LAContext()
        if ctx.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: nil) == false{
            newIsOn = false
        }
        userDefaults.setBool(newIsOn, forKey: "fingerPrint")
        userDefaults.synchronize()
        return newIsOn
    }
    //读取指纹是否解锁
    static func isLockWithfingerPrint() -> Bool {
        
        let device : String = UIDevice.currentDevice().systemVersion
        let dou:Double = (device as NSString).doubleValue
        if dou <= 8 {
            return false
        }
        let ctx = LAContext()
        if ctx.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: nil) == false{
            
            return false
        }
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if userDefaults.objectForKey("fingerPrint") == nil {
            userDefaults.setBool(false, forKey: "fingerPrint")
            userDefaults.synchronize()
            return false
        }else{
            //开启指纹解锁功能
            return userDefaults.boolForKey("fingerPrint")
        }
    }

}
