//
//  BudgetTarget.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct BudgetTarget {
    
    /*
     budget would have a target value, a category, a goal date or goal length, a list of associated items, and a calculated value which is the target value less the values of the lineItems
     alternately there is a category object, which has the associated lineItems and a target
     
     jobs: associate the lineItems with a category
     assign budgetary values to categories
     calculate budget targets live
     
     
     */
    
    var maxSpendPerIncrement: Double
    var category: CategoryTypes
    
    var increment: DateComponents // the length of time in human readable units that maxSpend is allotted for
    
}
