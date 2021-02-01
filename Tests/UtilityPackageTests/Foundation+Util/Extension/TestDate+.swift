

import Foundation
import XCTest
import UtilityPackage

final class DateTestCase: XCTestCase {
    
    var testDate: Date?
    
    override func setUpWithError() throws {
        testDate = "2019-03-29".toDate(formatter: "yyyy-mm-dd")
    }
    
    // Checking for date operations.
    /// - Parameters : testDate - Its a dummy value.
    /// Passing input Date type.

    func test_DateOperations(){
        
        /// Checking for (today, yesterday, tomorrow)
        
        XCTAssertNotEqual(testDate?.dateToPossibleSpell(), "Today")
//        XCTAssertEqual(Date().dateToPossibleSpell(), "Today")
  
        /// Checking for year difference.

        let dateDifference = try? XCTUnwrap(Date().years(from: testDate!))
        
        XCTAssertEqual(dateDifference, 2)
        
        /// Checking for Day of week
        
        XCTAssert(((testDate?.dayOfWeek) != nil), "Tuesday")
    }
}
