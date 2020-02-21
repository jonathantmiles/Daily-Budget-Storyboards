//
//  LineItemController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class LineItemController {
    
    // CRUD:
    
    func addNewLineItem(itemName: String, category: CategoryTypes, amount: Double) {
        let newLineItem = LineItem(itemName: itemName, category: category, amount: amount)
        lineItems.append(newLineItem)
        sortLineItems()
    }
    
    // CAUTION: this does not allow for changing the date as written; beware overreliance on Date as a UUID
    func updateLineItem(lineItem: LineItem, itemName: String?, category: CategoryTypes?, amount: Double?) {
        let index = lineItems.firstIndex { (target) -> Bool in
            return target.date == lineItem.date
        }
        if let itemName = itemName,
            let category = category,
            let amount = amount,
            let index = index {
            let newLineItem = LineItem(itemName: itemName, category: category, amount: amount)
            lineItems.remove(at: index)
            lineItems.insert(newLineItem, at: index)
        }
    }
    
    // cleanup section
    
    func sortLineItems() {
        // sort according to date
    }
    
    //section: variables
    
    var lineItems: [LineItem] = []
    
}
