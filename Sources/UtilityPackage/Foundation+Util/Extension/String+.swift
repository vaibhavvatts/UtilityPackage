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
        
        #if DEBUG
        return  dateFormatter.date(from: self) ?? Date()
        #else
        return  dateFormatter.date(from: self) ?? Date()
        #endif
        
    }
    
    var getLanguage: String? {
        guard let languageCode = self.components(separatedBy: "-").first else { return nil }
        let locale: Locale = .current
        let language = locale.localizedString(forLanguageCode: languageCode)
        return language
    }
    
    var getCountry: String? {
        guard let countryCode = self.components(separatedBy: "-").last else { return nil }
        let locale: Locale = .current
        let country = locale.localizedString(forRegionCode: countryCode)
        return country
    }
}
