//
//  FingersettingCell.swift
//  FingerLock
//
//  Created by Zzcz on 2017/3/8.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class FingersettingCell: UITableViewCell {

    typealias SwitchChose = (UISwitch) -> ()
    
    var choseclickwithswitch : SwitchChose?
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var issetting: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func cellForModel(model : FingersettingModel) -> () {
        title.text = model.title
        issetting.on = model.isok
    }

    @IBAction func clickchose(sender: UISwitch) {
        if choseclickwithswitch != nil {
            choseclickwithswitch!(sender)
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
