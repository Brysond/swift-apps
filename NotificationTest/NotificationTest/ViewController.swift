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
    
    //This code detects shakes of the device
    var shakeCount = 0
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        shakeCount += 1
        print(shakeCount)
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
        content.userInfo = ["customData":"don't know what this does yet"]
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "morseCode.caf"))
        
        
        
        //var dateComponents = DateComponents()
        //dateComponents.hour = 12
        //dateComponents.minute = 38
        //let trigger = UNCalendarNotificationTrigger(dateMatching:dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        
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
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response:UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data recoeved: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                
                print("The default")
            
            case "test_one":
                print("This is the first test case")
            
            case "test_two":
                print("This is the second test case")
                
            default:
                break
            }
        }
        
        completionHandler()
    }
}
