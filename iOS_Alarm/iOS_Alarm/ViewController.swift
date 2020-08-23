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
    
    @IBOutlet var timmerPicker: UIDatePicker!
    @IBAction func showNotificationAction(_ sender: Any) {
        print("date= \(timmerPicker.date)")
        //        let calendar = Calendar.current
        //        var components = calendar.dateComponents([.day, .month, .year,.hour,.minute,.second], from: Date())
        //        let tempDate = calendar.date(from: components)
        //        print(tempDate)
        
        //appDelegate?.showEduNotification(date: timmerPicker.date)
        
        for index in 1...3 {
            
            //Setting content of the notification
            let content = UNMutableNotificationContent()
            content.title = "알람"
            content.subtitle = "왕초보 일어나세요~~"
            content.body = "일어나 아 침 이 야"
            content.summaryArgument = "Sehwa Ryu"
            content.summaryArgumentCount = 10
            
            //Setting time for notification trigger
            //블로그 예제에서는 TimeIntervalNotificationTrigger을 사용했지만, UNCalendarNotificationTrigger사용법도 같이 올려놓을게요!
            
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: { (didAllow, error) in
            
        })
        UNUserNotificationCenter.current().delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : UNUserNotificationCenterDelegate {
    //To display notifications when app is running  inforeground
    
    //앱이 foreground에 있을 때. 즉 앱안에 있어도 push알림을 받게 해줍니다.
    //viewDidLoad()에 UNUserNotificationCenter.current().delegate = self를 추가해주는 것을 잊지마세요.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let settingsViewController = UIViewController()
        settingsViewController.view.backgroundColor = .gray
        self.present(settingsViewController, animated: true, completion: nil)
        
    }
}

