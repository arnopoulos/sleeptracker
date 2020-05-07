//
//  Date+Extensions.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import Foundation

extension Date {

    //Precondition: The delta between the date is less than a day and greater than a minute
    func delta(to date: Date) -> String? {
        let components = Calendar.current.dateComponents([.hour, .minute], from: self, to: date)
        if let hour = components.hour, let minute = components.minute {
            return "\(hour)h \(minute)m"
        } else if let minute = components.minute {
            return "\(minute)m"
        }
        return nil
    }

    var time: String {
        //TODO: Change based on locale settings
        //      primarily 24 hour time
        let formatter = DateFormatter()
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        formatter.dateFormat = "hh:mma"
        return formatter.string(from: self)
    }
}
