//
//  Date+.swift
//  Utility
//
//  Created by Vaibhav on 07/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

public extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var getDateAndTime: String {
        self.toString(dateFormat: "MMM d, h:mm a")
    }
    
    var getDate: String {
        self.toString(dateFormat: "MMM d")
    }
    
    func getTime() -> String {
        self.toString(dateFormat: "HH:mm")
    }
    
    var getTimeWithAMPM: String {
        self.toString(dateFormat: "h:mm a")
    }
    
    func getDays() -> String{
        let currentDay: String = self.toString(dateFormat: "dd")
        
        if currentDay == Date.tomorrow.toString(dateFormat: "dd"){
           return "Tomorrow"
        }else if currentDay == Date().toString(dateFormat: "dd"){
            return "Today"
        }else{
            return "\(self.days(from: Date())) days"
        }
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        return self
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.timeZone = TimeZone.current
//        let dateString = dateFormatter.string(from: self)
//        return dateFormatter.date(from: dateString) ?? Date()
    }
    
    func dateToPossibleSpell() -> String {
        if Calendar.current.isDateInToday(self) { return "Today" }
        if Calendar.current.isDateInYesterday(self) { return "Yesterday" }
        if Calendar.current.isDateInTomorrow(self) { return "Tomorrow" }
        
        return ""
    }
    
    var time: (hour: Int, min: Int) {
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: self)
        if let hour = comp.hour, let minute = comp.minute {
            return (hour, minute)
        }
        return (0,0)
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    var monthNumeric: Int? {
        let components = getDateTimeComponent()
        return components.month
    }
    
    var year: Int? {
        let components = getDateTimeComponent()
        return components.year
    }
    
    var dayNumeric: Int? {
        let components = getDateTimeComponent()
        return components.day
    }
    
    var hour: Int? {
        let components = getDateTimeComponent()
        return components.hour
    }
    
    var minute: Int? {
        let components = getDateTimeComponent()
        return components.minute
    }
    
    var second: Int? {
        let components = getDateTimeComponent()
        return components.second
    }
    
    private func getDateTimeComponent() -> DateComponents {
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: self)
        return components
    }
    
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func dateAmPm() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: self)
        return Date12
    }
}
