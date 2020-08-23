//
//  ViewController.swift
//  iOS_Alarm
//
//  Created by Sehwa Ryu on 2020/08/23.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var alarmList : [Alarm] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var timmerPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: { (didAllow, error) in
            
        })
        UNUserNotificationCenter.current().delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        setAlarmList()
    }
    
    @IBAction func showNotificationAction(_ sender: Any) {
        print("date= \(timmerPicker.date)")
        
        for index in 1...3 {
            
            //Setting content of the notification
            let content = UNMutableNotificationContent()
            content.title = "알람"
            content.subtitle = "왕초보 일어나세요~~"
            content.body = "일어나 아 침 이 야"
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setAlarmList() {
        let alarm1 = Alarm(time: "4:30", amPm: "PM", alarmSwitch: true)
        let alarm2 = Alarm(time: "4:30", amPm: "PM", alarmSwitch: true)

        let alarm3 = Alarm(time: "4:30", amPm: "PM", alarmSwitch: true)
        let alarm4 = Alarm(time: "4:30", amPm: "PM", alarmSwitch: true)
        let alarm5 = Alarm(time: "4:30", amPm: "PM", alarmSwitch: true)

        
        alarmList = [alarm1, alarm2, alarm3, alarm4, alarm5]
    }
    
    
}

extension ViewController : UNUserNotificationCenterDelegate {
    //To display notifications when app is running  inforeground
    
    // 앱안에 있어도 push알림 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let settingsViewController = UIViewController()
        settingsViewController.view.backgroundColor = .gray
        self.present(settingsViewController, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let alarmCell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.identifier, for: indexPath) as? AlarmTableViewCell
            else {return UITableViewCell() }
        return alarmCell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

