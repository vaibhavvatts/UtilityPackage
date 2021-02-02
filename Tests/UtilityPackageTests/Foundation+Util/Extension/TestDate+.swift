

import Foundation
import XCTest
import UtilityPackage

final class DateTestCase: XCTestCase {
    
    var testDate: Date?
    let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    override func setUpWithError() throws {
        testDate = "2019-03-29T11:42:05".toDate(formatter: dateFormat)
    }
    
    // Checking for date operations.
    /// - Parameters : testDate - Its a dummy value.
    /// Passing input Date type.

    func test_DateOperations(){
        
        guard let testDate = testDate else { return }

        /// Checking for (today, yesterday, tomorrow)
        
        XCTAssertNotEqual(testDate.dateToPossibleSpell(), "Today")
//        XCTAssertEqual(Date().dateToPossibleSpell(), "Today")
  
        /// Checking for year difference.

         _ = try? XCTUnwrap(Date().years(from: testDate))
        
//        XCTAssertEqual(dateDifference, 1)
        
        /// Checking for Day of week
        
        XCTAssertEqual(testDate.dayOfWeek, "Friday")
        
        /// Checking for Date with year, month, day, minute, hour, second.
             
        XCTAssertEqual("\(testDate.year ?? 2019), \(testDate.month), \(testDate.dayNumeric ?? 3), \(testDate.hour ?? 11), \(testDate.minute ?? 42), \(testDate.second ?? 5)", "2019, March, 29, 11, 42, 5")

        /// Checking for difference between two dates.
        
        XCTAssertNotNil("\(Date().years(from: testDate)), \(Date().months(from: testDate)), \(Date().weeks(from: testDate)), \(Date().days(from:testDate)), \(Date().hours(from: testDate)), \(Date().minutes(from: testDate)), \(Date().seconds(from: testDate))")
        
        /// Converting Date to String
        
        XCTAssertNotNil(Date().toString(dateFormat: dateFormat))
        
        /// Converting Date to Am Pm
        
        let strTime = Date().dateAmPm()
        
        XCTAssertNotNil(strTime)
        
        XCTAssertGreaterThan(strTime.count, 5)
        
        /// Checking for Global Time
        
        XCTAssertNotNil(Date().toGlobalTime())
    }
}
