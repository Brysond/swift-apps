//
//  ViewController.swift
//  NotificationTest
//
//  Created by Bryson, David (IRG) on 16/03/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UserNotifications
import UIKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    var nameOfAudioFile = ""
    var audioPlayer = AVAudioPlayer()
    
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
        audioPlayer.stop()
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Test notification"
        content.body = "Lorem ipsum whatsit whatsit"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData":"don't know what this does yet"]
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: nameOfAudioFile))
        
        
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
    
    
    @IBAction func importTapped(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.apple.coreaudio-format"], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.modalPresentationStyle = .pageSheet
        documentPicker.shouldShowFileExtensions = true
        present(documentPicker, animated: true, completion: nil)
        
    }
}

extension ViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard controller.documentPickerMode == .import, let url = urls.first else {
            return
        }
        
        let filename = url.lastPathComponent
        nameOfAudioFile = filename
        let targetURL = try! FileManager.default.soundsLibraryURL(for: filename)

        // copy audio file to /Library/Sounds
        do {
            if FileManager.default.fileExists(atPath: targetURL.path) {
                try FileManager.default.removeItem(at: targetURL)
            }
            try FileManager.default.copyItem(at: url, to: targetURL)
        } catch {
            print("Cannot copy item at \(url) to \(targetURL)")
            print("boingboingboing")
        }
        

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            audioPlayer = try AVAudioPlayer(contentsOf: targetURL)

            audioPlayer.play()
            print("I'm playing it")

        } catch let error {
            print(error.localizedDescription)
            print("Failed to play")
        }
    }
    
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }
}

extension FileManager {

    func soundsLibraryURL(for filename: String) throws -> URL {
        let libraryURL = try url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let soundFolderURL = libraryURL.appendingPathComponent("Sounds", isDirectory: true)
        if !fileExists(atPath: soundFolderURL.path) {
            try createDirectory(at: soundFolderURL, withIntermediateDirectories: true)
        }
        return soundFolderURL.appendingPathComponent(filename, isDirectory: false)
    }
}
