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
    /// Increment the number of days from a given Date. Not intended for incrementing months or intervals larger than 28 days
    func rollover(date: Date, withNumberOfDays daysAdded: Int) -> Date {
        
        var dateArray = newArray(fromDate: date)
        let newDay = dateArray[1] + daysAdded
        
        // if not close to a new month
        if newDay < 29 {
            dateArray[1] = newDay
            
            return newDate(fromArray: dateArray)
        }
        
        var lastDayOfMonth = 31
        
        // handling each month length if there would be a rollover
        if dateArray[0] == 2 {
            
            lastDayOfMonth = isLeap(year: dateArray[2]) ? 29 : 28
            
        } else if hath30Days.contains(dateArray[0]) {
            
            lastDayOfMonth = 30
            
        } else if hath31Days.contains(dateArray[0]) {
            
            // lastDayOfMonth = 31
            
        } else {
            fatalError()
        }
        
        // increment year if December and set month to January
        if dateArray[0] == 12 {
            dateArray[2] += 1
            dateArray[0] = 1
        } else {
            // increment month
            dateArray[0] += 1
        }
        // set new day
        dateArray[1] = newDay - lastDayOfMonth
        
        return newDate(fromArray: dateArray)
    }
    
    // MARK: - Formatter
    
    var dateFormatter = DateFormatter()
    
    let hath30Days = Set(arrayLiteral: 4, 6, 9, 11)
    let hath31Days = Set(arrayLiteral: 1, 3, 5, 7, 8, 10, 12)
    
    func isLeap(year: Int) -> Bool {
        if year % 400 == 0 {
            return true
        }  else if year % 100 == 0 {
            return false
        } else if year % 4 == 0 {
            return true
        } else {
            return false
        }
    }
    
    /// Returns an array of Int values for month, day, year respectively
    func newArray(fromDate date: Date) -> [Int] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        
        let dateString = dateFormatter.string(from: date)
        let subStringSequence = dateString.split(separator: ".")
        return subStringSequence.map( { Int($0)! } )
    }
    
    /// Joins together an array of Int values from month, day, year into a Date
    func newDate(fromArray array: [Int]) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        
        let dateArrayAsStrings = array.map( { String($0) } )
        let newDateString = dateArrayAsStrings.joined(separator: ".")
        
        return dateFormatter.date(from: newDateString)!
    }

    // MARK: - Singleton
    
    public var shared = DateController()
    
}

enum durationOfBudget {
    case everyDay, everyWeek, everyTwoWeeks, everyMonth
}
