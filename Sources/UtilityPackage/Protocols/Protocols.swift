//
//  File.swift
//  
//
//  Created by Vaibhav on 04/02/21.
//

import Foundation
import SwiftUI

public protocol HorizontalScrollControlSnippetProtocol: Hashable {
    associatedtype T1
    associatedtype T2
    
    var display: (item1: T1, item2: T2) {get}
    
    var displayMultiple: (item1: T1, item2: T2, item3: T2) {get}
}

public extension HorizontalScrollControlSnippetProtocol {
    var display: (item1: String, item2: String) { return ("", "") }
    
    var displayMultiple: (item1: String, item2: String, item3: String) { return ("", "", "") }
}

