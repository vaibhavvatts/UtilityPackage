//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 2/22/22.
//

import Foundation

extension Calendar {
    public static var currentCalendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        return calendar
    }
}
