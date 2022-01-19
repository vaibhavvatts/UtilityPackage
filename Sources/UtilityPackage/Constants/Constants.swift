//
//  File.swift
//  
//
//  Created by Vaibhav on 04/02/21.
//

import Foundation
import UIKit

public enum UtilConstants {
    public static var screenDimention: (height: CGFloat, width: CGFloat) { return (UIScreen.main.bounds.height, UIScreen.main.bounds.width) }
    
    public static let dotMark = "• "
    public static let done = "Done"
    public static let save = "Save"
    public static let clear = "Clear"
    public static let undo = "Undo"
    public static let redo = "Redo"
    public static let delete = "Delete"
    public static let reset = "Reset"
    public static let settings = "Config"
    public static let back = "Back"
    public static let gradient = "Gradient"
    public static let important = "Important!"
    public static let oh = "Ohh ho!"
    public static let great = "Great"
    public static let okay = "Okay"
    public static let understand = "I Understand"
    public static let edit = "Edit"
    public static let title = "Note"
    public static let photo = "Photo"
    public static let album = "Album"
    public static let cancel = "Cancel"
    public static let alert = "Alert"
    public static let skip = "Skip"
    public static let gotIt = "Got it!"
    public static let reminder = "Reminder"
    public static let dueDate = "Due Date"
    public static let startDate = "Start Date"
    public static let favourite = "Important"
    public static let wallpaper = "Wallpaper"
    public static let ticker = "Ticker"
    public static let left = "Left"
    public static let trashBin = "Trash Bin"
    public static let loadingPleaseWait = "Please Wait...!!"
    public static let retry = "Retry"
    public static let help = "Help & How to"
    public static let Down = "Down"
    public static let improvemetsFeedback = "Improvement & Feedback"
    public static let blur = "Blur"
    public static let image = "Image"
    public static let presets = "Presets"
    public static let unsplash = "Unsplash"
    public static let dismiss = "Dismiss"
    public static let sounds = "Sounds"
    public static let remove = "Remove"
    public static let duplicate = "Duplicate"
    public static let saveAndExit = "Save & Exit"
    public static let exit = "Exit"
    public static let disappear = "Disappear"
    public static let goToSettings = "Go to Settings"
    public static let notificationFailureMessage = "To receive reminders, you must allow notifications from Settings."
    public static let trash = "Trash Bin"
    public static let today = "Today"
    public static let tomorrow = "Tomorrow"
    public static let prferencesNotification = "Go to Preferences -> Notifications & Focus and Allow Notifications for this App."
    public static let shareText = "Share Text"
    public static let saveAsImage = "Save as Image"
    public static let options = "Options"
    public static let readOut = "Text to Speech"
    public static let stop = "Stop"
    public static let controlCenterPersonalization = "Control Center : Personalization"
    public static let controlCenter = "Control Center"
    public static let small = "Small"
    public static let medium = "Medium"
    public static let large = "Large"
    public static let deletePermanently = "Delete Permanently"
    public static let tapAgainToPause = "1. Tap again 'Text to Speech' button to Stop. \n2. Device should NOT be in Silent Mode. \n3. Visit Note settings to change Voice options."
    public static let photoAccessFailureMessage = "To save Wallpapers, you must allow photo permission from Settings."
    public static let allowNotifications = "Allow Notifications!"
    public static let languageAndVoice = "Language & Voice"
    public static let add = "Add"
    public static let category = "Category"
    public static let type = "Type"
    public static let preAlarm = "Pre Alarm"
    public static let preAlarms = "Pre Alarms"
    public static let autoSnooze = "Auto Snooze"
    public static let manualSnooze = "Manual Snooze"
    public static let set = "Set"
    public static let none = "None"
    public static let specificTimes = "Specific Times"
    public static let everyXHour = "Every x Hours"
    public static let addTime = "Add Time"
    public static let startTime = "Start Time"
    public static let repeatConstant = "Repeat"
    public static let timesADay = "Times a Day"
    public static let endTimes = "End Times"
    public static let allDay = "All Day"
    public static let days = "Days"
    public static let endDate = "End Date"
    public static let totalDays = "Total Days"
    public static let yes = "Yes"
    public static let somethingWentWrong = "Something Went Wrong"
    public static let pause = "Pause"
    public static let continue_ = "Continue"
    public static let play = "Play"
    public static let start = "Start"
    public static let recording = "Recording"
    public static let retake = "Retake"
    public static let retakeRecording = "Do you want to take Fresh recording by discarding the existing one ?"
    public static let recover = "Recover"
    public static let all = "All"
    public static let isAutoSnoozeActive = "Is Auto Snooze Active"
    public static let inActive = "Inactive"
    public static let list = "List"
    public static let quotes = "Quotes"
    
    public enum Spacing {
        public static let outerPadding:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 16 : 18
        public static let intermidentPadding:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 3 : 6
        public static let intrimPadding:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 4 : 6
        
        //new
        public static let exteriorMargin: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 10 : 17
//        public static let boxBottomPadding: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 6 : 12
        public static let boxIntermidentPadding: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 4 : 7
        
        public static let interiorMargin: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 10 : 16
    }
}
