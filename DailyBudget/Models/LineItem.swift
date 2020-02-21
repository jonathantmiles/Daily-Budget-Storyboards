//
//  LineItem.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct LineItem {
    var itemName: String
    var category: CategoryTypes
    var amount: Double
    let date = Date()
}

enum CategoryTypes: String {
    case food = "food"
    case groceries = "groceries"
    case transportation = "transportation"
    case discretionary = "discretionary"
}
