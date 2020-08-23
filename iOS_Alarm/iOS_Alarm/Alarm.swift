//
//  Alarm.swift
//  iOS_Alarm
//
//  Created by Sehwa Ryu on 2020/08/23.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

struct Alarm {
    var time: String
    var amPm: String
    var alarmSwitch: Bool
    
    init(time: String, amPm: String, alarmSwitch: Bool) {
        self.time = time
        self.amPm = amPm
        self.alarmSwitch = alarmSwitch
        
    }
    

    
}
