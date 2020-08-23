//
//  AppDelegate.swift
//  iOS_Alarm
//
//  Created by Sehwa Ryu on 2020/08/23.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: { (authorized, error) in
            if !authorized {print("App is useless becase you did not allow notification")
            }
        })
        
        let HollowAction = UNNotificationAction(identifier: "addHellow", title: "Hellow", options: [])
        let ByeAction = UNNotificationAction(identifier: "addBye", title: "Bye", options: [])
        
        let category = UNNotificationCategory(identifier: "eduCategory", actions: [HollowAction, ByeAction], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
           UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "addHellow" {
            print("Say Hellow!")
        }else{
            print("Say Bye~")
        }
    }
    
    func showEduNotification(date: Date){
        let content = UNMutableNotificationContent()
        content.title = "알람"
        content.body = "왕초보 일어나세요~"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "eduCategory"
        
        //Timmer
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 300, repeats: false)
        
        //Date
        //        let date = Date(timeIntervalSinceNow: 3600)
        //        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,repeats: false)
        
        //Weekly
        //        let triggerWeekly = Calendar.current.dateComponents([.weekday,hour,.minute,.second,], from: date)
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
        
        //Daily
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        

        let request = UNNotificationRequest(identifier: "eduNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request){ (error) in
            if let error = error {
                print("Error:\(error.localizedDescription)")
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

