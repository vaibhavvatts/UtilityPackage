

import Foundation
import XCTest
import UtilityPackage

final class ArrayTestCase: XCTestCase {
    
    var arrToBeEnumerated: Array<Any>?
    
    override func setUpWithError() throws {
      arrToBeEnumerated = Array(stride(from: 5, to: 15, by: 1))
    }
   
    // Checking for nil values while enumerating.
    /// Passing input array of integers.
    
    func test_Enumerate() {
        arrToBeEnumerated?.enumerate({ (value, index, condition) in
          XCTAssertNotNil(value)
        })
    }
    
    func test_RevereseEnumerate(){
        arrToBeEnumerated?.reverseEnumerate { (value, index, condition) in
            XCTAssertNotNil(value)
        }
    }
    
    // Checking for nonEmptyValue (Collection as a data type).
    /// - Parameters : array of integers (arrToBeEnumerated)
    /// Passing input  collection (dictionary, array, set)

    func test_IsNotEmpty(){
        XCTAssert(((arrToBeEnumerated?.isNotEmpty()) != nil))
    }

}
