

import Foundation
import XCTest
import UtilityPackage

final class ArrayTestCase: XCTestCase {
    
    var arrToBeEnumerated: Array<Any>?
    
    override func setUpWithError() throws {
        
        let user = UserModel(name: "Epiphany Labs", age: 2, income: 9999.9)
        
        arrToBeEnumerated = [1, 0.2, 0.20057, "Ephiphany Labs", user]
    }
   
    // Checking for nil values and condition that satisfy certain expectation.
    /// Passing generic array of type Any.
    
    func test_Enumerate() {
        arrToBeEnumerated?.enumerate({ (value, index, condition) in
            if let requiredValue = value as? Double{
                print(index)
                XCTAssertNotNil(condition = requiredValue == 0.20057 ?  true : false)
            }
          XCTAssertNotNil(value)
        })
    }
    
    func test_RevereseEnumerate(){
        arrToBeEnumerated?.reverseEnumerate { (value, index, condition) in
            if let requiredValue = value as? Double{
                print(index)
                XCTAssertNotNil(condition = requiredValue == 0.20057 ?  true : false)
            }
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

