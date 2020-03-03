//
//  CategoryColumn.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 3/2/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct CategoryColumn {
    var category: CategoryTypes
    var column: [LineItem]
    var budgetTarget: BudgetTarget
}
