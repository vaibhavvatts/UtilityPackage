

import Foundation

import XCTest
import UtilityPackage

final class IntTestCase: XCTestCase {

    // Checking for correct ordinals(suffix values:  st, nd, rd, th).
    /// - Parameters : dummy value of 100.
    /// Passing input as  an integer.

    func test_Ordinal(){
        XCTAssertNotNil(100.ordinal)
        XCTAssertEqual(100.ordinal, "100th")
    }
    
    // Checking for Leading zeros (remove 0s before non zeros).
    /// - Parameters : dummy value as 0028
    /// Passing input as (T, True, 1) for true values and (F, False, 0)
 
    func test_LeadingZero(){
        XCTAssertNotNil(0028.leadingZero)
        XCTAssertEqual(0028.leadingZero, "28")
    }

}
