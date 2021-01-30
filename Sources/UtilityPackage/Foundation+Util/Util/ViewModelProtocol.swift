//
//  ViewModelProtocol.swift
//  ELStickMeNotes
//
//  Created by Vaibhav on 08/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

public protocol VtoVMChannelDelegate: AnyObject {
    func didSucceed()
    func didFailed()
}

public protocol ViewModelProtocol {
    associatedtype Element
    var arrResult: [Element] {get set}
}

public extension ViewModelProtocol {
    var totalCount: Int { return arrResult.count}
    
    func getItem(for indexPath: IndexPath) -> Element? { arrResult[safe: indexPath.item] }
}
