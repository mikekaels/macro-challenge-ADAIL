//
//  Extension + Date.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 02/12/21.
//

import Foundation

extension Date {
    func days(from date: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: self).day!
    }
    func adding(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    func adding(weeks: Int) -> Date {
        Calendar.current.date(byAdding: .weekOfYear, value: weeks, to: self)!
    }
    
    func formatterDate(deadline: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        return formatter.string(from: deadline)
    }
    
    func toString()-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d-MM-yyyy"
        return formatter.string(from: self).uppercased()
    }
}
