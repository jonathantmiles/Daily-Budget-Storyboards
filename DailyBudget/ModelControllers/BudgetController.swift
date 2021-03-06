//
//  BudgetController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 3/3/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class BudgetController {
    
    // MARK: - BudgetTarget CRUD
    
    func addNewBudgetTarget(maxSpend: Double, category: CategoryTypes, increment: DateComponents) {
        let newTarget = BudgetTarget(maxSpendPerIncrement: maxSpend, category: category, increment: increment)
        targets?.append(newTarget)
    }
    
    func replace(budgetTarget target: BudgetTarget, atIndex i: Int) {
        targets?.remove(at: i)
        targets?.insert(target, at: i)
    }
    
    // MARK: - Properties
    
    var targets: [BudgetTarget]?
    
    var columns: [CategoryColumn]?
    // managing contents of columns works according to shared instance of CategoryColumnController; however you'll have to pass in BudgetController.columns[i] which may be verbose
    
    
    /*
     array of columns
     add to columns
     remove from columns
     change lineItem to another column
     create lineItem and assign to category
     
     compose an overall array by sorting lineItems by date
     sort items in column according to date
     */
}
