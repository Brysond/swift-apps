//
//  ViewController.swift
//  NotificationTest
//
//  Created by Bryson, David (IRG) on 16/03/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
        // Do any additional setup after loading the view.
    }
    
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { granted, error in
            if granted {
                print("Was granted")
            } else {
                print("Was not granted")
            }
        })
    }
    
    @objc func scheduleLocal() {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Test notification"
        content.body = "Lorem ipsum whatsit whatsit"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["test":"don't know what this does yet"]
        content.sound = .default
        
        
        
        var dateComponents = DateComponents()
        dateComponents.hour = 15
        dateComponents.minute = 54
        //let trigger = UNCalendarNotificationTrigger(dateMatching:dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let testActionOne = UNNotificationAction(identifier: "test_one", title: "Test action 1", options: .foreground)
        let testActionTwo = UNNotificationAction(identifier: "test_two", title: "Test action 2", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [testActionOne, testActionTwo], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didRecieve response:UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = user
    }
}
