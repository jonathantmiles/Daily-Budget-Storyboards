//
//  LineItem.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct LineItem: Comparable {
    var itemName: String
    var category: CategoryTypes
    var amount: Double
    let date: Date
    
    static func < (lhs: LineItem, rhs: LineItem) -> Bool {
        if lhs.date < rhs.date {
            return true
        } else {
            return false
        }
    }
}

enum CategoryTypes: String, CaseIterable {
    case food
    case groceries
    case transportation
    case discretionary
}
