//
//  String+.swift
//  Utility
//
//  Created by Vaibhav on 14/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

public extension String {
    func amOrPm() -> String {
        //        let dateAsString = "13:15"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: date!)
        return Date12
    }
    
    func toDate(formatter: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: self)!
    }
}
