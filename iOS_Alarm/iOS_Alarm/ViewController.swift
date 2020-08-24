//
//  ViewController.swift
//  iOS_Alarm
//
//  Created by Sehwa Ryu on 2020/08/23.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let shared = ViewController()

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
    //To display notifications when app is running inforeground
    
    // 앱안에 있어도 push알림 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    // 알림 설정 탭 열기
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

