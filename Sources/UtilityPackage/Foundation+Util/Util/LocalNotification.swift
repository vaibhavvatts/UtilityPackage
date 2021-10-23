//
//  LocalNotification.swift
//  JotDown
//
//  Created by Vaibhav on 25/05/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

public struct PayloadLocalNotification {
    public init(id: String, title: String, subTitle: String, body: String, time: TimeInterval? = nil, dateTime: Date? = nil, sound: String? = nil, recurringTime: Float = 60.0) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.body = body
        self.time = time
        self.dateTime = dateTime
        self.sound = sound
        self.recurringTime = recurringTime
    }
    
    public var id: String
    public var title: String
    public var subTitle: String
    public var body: String
    public var time: TimeInterval?
    public var dateTime: Date?
    public var sound: String?
    public var recurringTime: Float = 60.0
}

public class LocalNotifications {
    public static func requestAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { status in
            if status.authorizationStatus == .notDetermined {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    
                }
            }
            else if status.authorizationStatus != .authorized {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: UtilConstants.important, message: UtilConstants.notificationFailureMessage, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: UtilConstants.goToSettings, style: UIAlertAction.Style.default, handler: { _ in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        
                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                print("Settings opened: \(success)") // Prints true
                            })
                        }
                    }))
                    alert.addAction(UIAlertAction(title: UtilConstants.cancel, style: UIAlertAction.Style.default, handler: nil))
                    UtilityUIKit.topViewController?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    public static func scheduleRecurringNotification(payload: PayloadLocalNotification) {
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = payload.title
        content.subtitle = payload.subTitle
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: payload.sound ?? "Default.mp3"))
        content.body = payload.body
        
        
        let thisTime:TimeInterval = 60.0 // 1 minute = 60 seconds
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: thisTime, repeats: true)
        let request = UNNotificationRequest(identifier: payload.id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    public static func scheduleNotification(payload: PayloadLocalNotification) {
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = payload.title
        content.subtitle = payload.subTitle
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: payload.sound ?? "Default.mp3"))
        content.body = payload.body
        
        if let date = payload.dateTime {
            print(date)
            let triggerComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerComponents, repeats: false)
            let request = UNNotificationRequest(identifier: payload.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
        else if let timeInternal = payload.time {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInternal, repeats: false)
            let request = UNNotificationRequest(identifier: payload.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    public static func removePendingNotification(payload: PayloadLocalNotification) {
        removePendingNotification(ids: [payload.id])
    }
    
    public static func removePendingNotification(id: String) {
        removePendingNotification(ids: [id])
    }
    
    public static func removePendingNotification(ids: [String]) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
    }
}
