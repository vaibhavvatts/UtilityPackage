
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

public enum EnumNotificationAction: String {
    case snooze, delete
    
    static func getActions(for types: [EnumNotificationAction]) -> [UNNotificationAction] {
        var actions = [UNNotificationAction]()
        
        for type in types {
            switch type {
            case .snooze:
                actions.append(UNNotificationAction(identifier: type.rawValue, title: "Snooze", options: []))
            case .delete:
                actions.append(UNNotificationAction(identifier: type.rawValue, title: "Delete", options: [.destructive]))
            }
        }
        
        return actions
    }
}

public typealias NotificationUserInfo = Dictionary<AnyHashable, Any>

public struct PayloadLocalNotification {
    
    public init(id: String, title: String, subTitle: String, body: String, time: TimeInterval? = nil, dateTime: Date? = nil, sound: String = "Default.mp3", recurringTime: Float = 60.0, notificationActions: [EnumNotificationAction]? = nil, userInfo: NotificationUserInfo? = nil) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.body = body
        self.time = time
        self.dateTime = dateTime
        self.sound = sound
        self.recurringTime = recurringTime
        self.notificationActions = notificationActions
        self.userInfo = userInfo
    }
    
    public var id: String
    public var title: String
    public var subTitle: String
    public var body: String
    public var time: TimeInterval?
    public var dateTime: Date?
    public var sound: String
    public var recurringTime: Float = 60.0
    public var notificationActions: [EnumNotificationAction]?
    public var userInfo: NotificationUserInfo?
}

public class LocalNotifications {
    public static func requestAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { status in
            if status.authorizationStatus == .notDetermined {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    
                }
            }
            else if status.authorizationStatus != .authorized || status.authorizationStatus == .denied{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    let alert = UIAlertController(title: UtilConstants.allowNotifications, message: UtilConstants.notificationFailureMessage, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: UtilConstants.goToSettings, style: UIAlertAction.Style.default, handler: { _ in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        
                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                                print("Settings opened: \(success)") // Prints true
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
//        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = payload.title
        content.subtitle = payload.subTitle
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: payload.sound ))
        content.body = payload.body
        
        let thisTime:TimeInterval = 60.0 // 1 minute = 60 seconds
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: thisTime, repeats: true)
        let request = UNNotificationRequest(identifier: payload.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
    
    public static func scheduleNotification(payload: PayloadLocalNotification) {
//        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = payload.title
        content.subtitle = payload.subTitle
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: payload.sound))
        content.body = payload.body
        
        if let userInfo = payload.userInfo {
            content.userInfo = userInfo
        }
        
        if let actions = payload.notificationActions, !actions.isEmpty {
            content.categoryIdentifier = payload.id
        }
        
        //        content.attachments = createImageAttachment(image: UIImage(named: "tmp"))
        
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
        
        if let actions = payload.notificationActions, !actions.isEmpty {
            registerCustomActions(actions: actions, identifier: payload.id)
        }
    }
    
    private static func registerCustomActions(actions: [EnumNotificationAction], identifier: String) {
        //      let snooze = UNNotificationAction(identifier: ActionIdentifier.snooze.rawValue, title: "Snooze", icon: UNNotificationActionIcon(systemImageName: "moon.zzz"))
        let userActions = identifier
        let category = UNNotificationCategory(identifier: userActions, actions: EnumNotificationAction.getActions(for: actions), intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
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


extension UIImage {
    func createLocalURL(imageName: String) -> URL? {
        let fileManager = FileManager.default
        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        let url = cacheDirectory.appendingPathComponent("\(imageName).png")
        
        guard fileManager.fileExists(atPath: url.path) else {
            guard let data = self.pngData() else { return nil }
            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }
        
        return url
    }
}

func createImageAttachment(image: UIImage?, imgName: String) -> UNNotificationAttachment? {
    if let image = image,
       let imageUrl = image.createLocalURL(imageName: imgName),
       let attachment = try? UNNotificationAttachment(identifier: imgName, url: imageUrl, options: nil) { attachment }
    return nil
}

extension UNNotification {
    public func snoozeNotification(for minutes: Int) {
        let content = UNMutableNotificationContent()
        
        content.title = self.request.content.title
        content.subtitle = self.request.content.subtitle
        content.body = self.request.content.body
        content.sound = self.request.content.sound
        
        let identifier = self.request.identifier
//        guard let oldTrigger = self.request.trigger as? UNCalendarNotificationTrigger else {
//            debugPrint("Cannot reschedule notification without calendar trigger.")
//            return
//        }

//        var components = oldTrigger.dateComponents
        var components = Calendar.current.dateComponents([.minute], from: Date())
        components.minute = (components.minute ?? 0) + minutes
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
//                debugPrint("Rescheduling failed", error.localizedDescription)
            } else {
//                debugPrint("rescheduled success")
            }
        }
    }

}
