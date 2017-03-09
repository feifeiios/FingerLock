//
//  FingersettingController.swift
//  FingerLock
//
//  Created by Zzcz on 2017/3/8.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit
import LocalAuthentication
class FingersettingController: UITableViewController {

    let dataarray : [FingersettingModel] = {
        let m1 =  FingersettingModel.init(dict: [:])
        m1.title = "指纹解锁"
        m1.isok = UserInfo.isLockWithfingerPrint()
        let m2 = FingersettingModel.init(dict: [:])
        m2.title = "支付解锁"
        return [m1,m2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.registerNib(UINib.init(nibName: "FingersettingCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "FingersettingCellID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FingersettingCellID", forIndexPath: indexPath) as! FingersettingCell
        switch indexPath.row {
        case 0:
            cell.choseclickwithswitch = { swit in
                let isOn = UserInfo.setLockWithFingerPrintOn(swit.on)
                swit.on = isOn
                //不支持指纹解锁
                if swit.on == true && isOn == false {
                    print("手机不支持指纹功能或是您未设置指纹")
                    return
                }
                //当手势解锁是开启状态时
                if swit.on {
                //开启验证解锁 添加验证解锁代码
                    let context = LAContext()
                    //        var msg = ""
                    if #available(iOS 9.0, *) {
                        context.evaluatePolicy(LAPolicy.DeviceOwnerAuthentication, localizedReason: "通过Home键验证已有手机指纹") { (sucess, authentcationError) in
                            
                            if sucess == true {
                                UserInfo.setLockWithFingerPrintOn(true)

                            }else {
                                UserInfo.setLockWithFingerPrintOn(false)
                            }
                        }
                    } else {
                        UserInfo.setLockWithFingerPrintOn(false)
                    }

                }
                
            }
            break
        case 1:
            break
        default:
            break
        }
        cell.cellForModel(dataarray[indexPath.row])
        return cell
    }

}
