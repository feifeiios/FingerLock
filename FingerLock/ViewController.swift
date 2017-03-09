//
//  ViewController.swift
//  FingerLock
//
//  Created by Zzcz on 2017/3/8.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    /**
     *  安全设置按钮
     */
    @IBAction func saftysettingClick(sender: UIButton) {
        self.navigationController?.pushViewController(SafetysettingController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

