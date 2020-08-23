//
//  AlarmTableViewCell.swift
//  iOS_Alarm
//
//  Created by Sehwa Ryu on 2020/08/23.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    static let identifier : String = "AlarmTableViewCell"
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amPmLabel: UILabel!
    
    @IBAction func switchAction(_ sender: Any) {
        if alarmSwitch.isOn {
            timeLabel.textColor = UIColor.white
            amPmLabel.textColor = UIColor.white
        } else {
            timeLabel.textColor = UIColor.lightGray
            amPmLabel.textColor = UIColor.lightGray
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
