//
//  SingleSelectionHandler.swift
//  IAPModuleSUI
//
//  Created by Rishabh Raj on 13/01/21.
//  Copyright © 2020 Rishabh Raj. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
public class SingleSelectionHandler<T>  : ObservableObject where T : Identifiable {
    
    public init() { }
    
    @Published private(set) var selectedItemIDs : [T.ID] = []
    
    public func selectItem(_ item: T) {
        selectedItemIDs = [item.id]
    }
    
    public func isItemSelected(_ item: T) -> Bool {
        return self.selectedItemIDs.contains(item.id)
    }
    public func getSelectedItem(for items : [T]) -> T? {
        var selectedItem : T?
        items.forEach { (item) in
            if item.id == selectedItemIDs.first {
                selectedItem = item
            }
        }
        return selectedItem
    }
    
    //TODO:- Can be made for multiple selection
    public func insertItem(_ item: T) {
        selectedItemIDs.append(item.id)
    }

}


