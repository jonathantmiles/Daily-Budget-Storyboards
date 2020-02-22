//
//  DateController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class DateController {
    
    func calculateEndDate(from startDate: Date) -> Date {
        
        return Date()
    }
    
    // MARK: - Formatter
    
    var dateFormatter = DateFormatter()
    
    func setUpFormatter() {
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    // MARK: - Singleton
    
    public var shared = DateController()
    
}

enum durationOfBudget {
    case everyDay, everyWeek, everyTwoWeeks, everyMonth
}
