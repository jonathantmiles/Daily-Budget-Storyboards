//
//  CategoryColumnController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 3/2/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class CategoryColumnController {
    
    func addLineItem(_ lineItem: LineItem, toColumn column: inout CategoryColumn) {
        column.column.append(lineItem)
    }
    
    func removeLineItem(_ lineItem: LineItem, fromColumn column: inout CategoryColumn) {
        // find lineItem in array
        let int = 0 // replace with index of item
        column.column.remove(at: int)
    }
    
    func changeCategory(ofColumn column: inout CategoryColumn, toCategory category: CategoryTypes) {
        column.category = category
    }
    
    func calculateTotalOfLineItems(withinCategory column: CategoryColumn) -> Double {
        var sum: Double = 0.0
        for i in 0..<column.column.count {
            sum += column.column[i].amount
        }
        return sum
    }
    
    func compareTotalToBudgetTarget(ofCategory column: CategoryColumn) -> Double {
        let total = calculateTotalOfLineItems(withinCategory: column)
        return total - column.budgetTarget.maxSpendPerIncrement
    }
    
    func sortColumnAccordingToDate(_ column: inout CategoryColumn) {
        column.column.sort { $0 < $1 }
    }
    
    static var shared = CategoryColumnController()
}
