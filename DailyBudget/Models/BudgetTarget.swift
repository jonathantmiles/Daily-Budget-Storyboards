//
//  BudgetTarget.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct BudgetTarget {
    
    var maxSpendPerIncrement: Float
    var category: CategoryTypes
    
    var increment: DateComponents // the length of time in human readable units that maxSpend is allotted for
    
}
