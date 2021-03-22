
import Foundation

import XCTest
import UtilityPackage

final class StringTestCase: XCTestCase {

    // Conversion of String in date and then date to string in different format.
    /// Passing input time in string format to get date and therefore convert in String
    /// - Important : Failing when getting nil on Conversion.
    
    func test_AmToPm() {
        var inputTime = "" // Crash Case
        inputTime = "Mon 1 Feb, 23:20" // Crash Case
        inputTime = "23:20"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: inputTime)
        XCTAssertNotNil(date)
        
    }
    
    // Conversion of String in Bool.
    /// - Parameters : T, true, 1 or F, False, 0.
    /// Passing input as (T, True, 1) for true values and (F, False, 0)
    
    func test_ToBool(){
        XCTAssert("T".toBool())
        XCTAssertFalse("F".toBool())
    }
}
