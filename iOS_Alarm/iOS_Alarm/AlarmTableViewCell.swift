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
            
            for index in 1...2 {
                
                //Setting content of the notification
                let content = UNMutableNotificationContent()
                content.title = "알람"
                content.subtitle = "왕초보 스터디 할 시간~~"
                content.body = "다들 클론 코딩해온거 자랑해보자~~"
                content.summaryArgument = "Sehwa Ryu"
                content.summaryArgumentCount = 10
                
                //Setting time for notification trigger
                
                //1. Use UNCalendarNotificationTrigger
                let date = Date(timeIntervalSinceNow: 70)
                var dateCompenents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
                
                let calendar = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)
                //let calendartrigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)
                
                
                //2. Use TimeIntervalNotificationTrigger
                let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
                
                //Adding Request
                // MARK: - identifier가 다 달라야만 Notification Grouping이 됩니닷..!!
                let request = UNNotificationRequest(identifier: "\(index)timerdone", content: content, trigger: TimeIntervalTrigger)
                
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                
            }
            
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
